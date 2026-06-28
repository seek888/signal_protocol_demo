import 'dart:typed_data';
import 'package:cryptography/cryptography.dart';
import 'ratchet_state.dart';
import 'chain_key.dart';
import 'message_keys.dart';
import '../crypto/curve25519.dart';
import '../crypto/aes_gcm.dart';
import '../message/signal_message.dart';
import '../protocol/protocol_constants.dart';
import '../protocol/protocol_exceptions.dart';

/// Double Ratchet engine — performs encrypt/decrypt on a [RatchetState].
class DoubleRatchet {
  /// Encrypt [plaintext] using the sender chain.
  ///
  /// Returns the new state and a [SignalMessage].
  static Future<(RatchetState, SignalMessage)> encrypt({
    required RatchetState state,
    required Uint8List plaintext,
  }) async {
    // Step the sender chain to get a fresh message key.
    final messageKeys = await state.senderChainKey.getMessageKeys();
    final newSenderChainKey = await state.senderChainKey.getNextChainKey();

    // AES-256-GCM encrypt.
    final ciphertext = await Aes256Gcm.encrypt(
      key: messageKeys.cipherKey,
      plaintext: plaintext,
    );

    // Compute MAC over ratchetKey || counter.
    final hmac = Hmac.sha256();
    final macInput = Uint8List.fromList([
      ...state.senderRatchetKeyPair.publicKey,
      ..._intToBytes(messageKeys.counter, 4),
    ]);
    final macResult = await hmac.calculateMac(
      macInput,
      secretKey: SecretKey(messageKeys.macKey),
    );

    final message = SignalMessage(
      ratchetKey: state.senderRatchetKeyPair.publicKey,
      counter: messageKeys.counter,
      previousCounter: state.previousCounter,
      ciphertext: ciphertext,
      mac: Uint8List.fromList(macResult.bytes),
    );

    final newState = state.copyWith(
      senderChainKey: newSenderChainKey,
      previousCounter: messageKeys.counter,
    );

    return (newState, message);
  }

  /// Decrypt a [SignalMessage].
  ///
  /// Handles skipped keys, DH ratchet, and chain ratcheting.
  static Future<(RatchetState, Uint8List)> decrypt({
    required RatchetState state,
    required SignalMessage message,
  }) async {
    // 1. Check skipped message keys.
    for (var i = 0; i < state.skippedMessageKeys.length; i++) {
      final skipped = state.skippedMessageKeys[i];
      if (_bytesEqual(skipped.ratchetKey, message.ratchetKey) &&
          skipped.counter == message.counter) {
        final plaintext = await _decryptWithKeys(skipped.messageKeys, message);
        final newSkipped =
            List<SkippedMessageKey>.from(state.skippedMessageKeys)
              ..removeAt(i);
        return (
          state.copyWith(skippedMessageKeys: newSkipped),
          plaintext,
        );
      }
    }

    // 2. Try to find a matching receiver chain.
    int? chainIndex;
    for (var i = 0; i < state.receiverChains.length; i++) {
      if (_bytesEqual(
          state.receiverChains[i].ratchetKey, message.ratchetKey)) {
        chainIndex = i;
        break;
      }
    }

    if (chainIndex == null) {
      // 3. DH ratchet: new sender chain required.
      return await _dhRatchetDecrypt(state: state, message: message);
    }

    // 4. Step the receiver chain to the message counter.
    final chain = state.receiverChains[chainIndex];
    final (newChain, newSkipped, plaintext) = await _stepChainDecrypt(
      chain: chain,
      message: message,
      skipped: state.skippedMessageKeys,
    );

    final newChains = List<ReceiverChain>.from(state.receiverChains)
      ..[chainIndex] = ReceiverChain(
          ratchetKey: chain.ratchetKey, chainKey: newChain);

    return (
      state.copyWith(
        receiverChains: newChains,
        skippedMessageKeys: newSkipped,
      ),
      plaintext,
    );
  }

  // ---------------------------------------------------------------------------
  // Helpers
  // ---------------------------------------------------------------------------

  static Future<(ChainKey, List<SkippedMessageKey>, Uint8List)> _stepChainDecrypt({
    required ReceiverChain chain,
    required SignalMessage message,
    required List<SkippedMessageKey> skipped,
  }) async {
    var currentChain = chain.chainKey;
    final newSkipped = List<SkippedMessageKey>.from(skipped);

    // Step until we reach the message counter.
    while (currentChain.index < message.counter) {
      final keys = await currentChain.getMessageKeys();
      if (newSkipped.length >= ProtocolConstants.maxSkip) {
        throw DuplicateMessageException('Too many skipped messages');
      }
      newSkipped.add(SkippedMessageKey(
        ratchetKey: chain.ratchetKey,
        counter: currentChain.index,
        messageKeys: keys,
      ));
      currentChain = await currentChain.getNextChainKey();
    }

    final messageKeys = await currentChain.getMessageKeys();
    final nextChain = await currentChain.getNextChainKey();
    final plaintext = await _decryptWithKeys(messageKeys, message);

    return (nextChain, newSkipped, plaintext);
  }

  static Future<(RatchetState, Uint8List)> _dhRatchetDecrypt({
    required RatchetState state,
    required SignalMessage message,
  }) async {
    // Step the previous receiver chain (skip keys).
    final newSkipped = List<SkippedMessageKey>.from(state.skippedMessageKeys);

    // DH ratchet step: derive new root + chain from their new ratchet key.
    final (newRoot, receiverChainKey) = await state.rootKey.createChain(
      theirRatchetKey: message.ratchetKey,
      ourRatchetKeyPair: state.senderRatchetKeyPair,
    );

    // Generate new sender ratchet key pair.
    final newSenderPair = await Curve25519.generateKeyPair();

    // Second DH ratchet step for sender chain.
    final (senderRootKey, senderChainKey) = await newRoot.createChain(
      theirRatchetKey: message.ratchetKey,
      ourRatchetKeyPair: newSenderPair,
    );

    // Add old receiver chain.
    final receiverChain = ReceiverChain(
      ratchetKey: message.ratchetKey,
      chainKey: receiverChainKey,
    );

    // Decrypt the message by stepping the new receiver chain.
    final (steppedChain, skippedAfter, plaintext) = await _stepChainDecrypt(
      chain: receiverChain,
      message: message,
      skipped: newSkipped,
    );

    final newState = state.copyWith(
      rootKey: senderRootKey,
      senderRatchetKeyPair: newSenderPair,
      senderChainKey: senderChainKey,
      receiverChains: [
        ReceiverChain(ratchetKey: message.ratchetKey, chainKey: steppedChain),
        ...state.receiverChains,
      ].take(ProtocolConstants.maxReceiverChains).toList(),
      skippedMessageKeys: skippedAfter,
      previousCounter: state.senderChainKey.index,
    );

    return (newState, plaintext);
  }

  static Future<Uint8List> _decryptWithKeys(
      MessageKeys keys, SignalMessage message) async {
    return Aes256Gcm.decrypt(
      key: keys.cipherKey,
      data: message.ciphertext,
    );
  }

  static bool _bytesEqual(Uint8List a, Uint8List b) {
    if (a.length != b.length) return false;
    for (var i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }

  static Uint8List _intToBytes(int value, int byteCount) {
    final bytes = Uint8List(byteCount);
    for (var i = 0; i < byteCount; i++) {
      bytes[byteCount - 1 - i] = (value >> (i * 8)) & 0xFF;
    }
    return bytes;
  }
}
