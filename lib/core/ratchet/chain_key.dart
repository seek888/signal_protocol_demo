import 'dart:typed_data';
import 'package:cryptography/cryptography.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../util/uint8list_converter.dart';
import 'message_keys.dart';

part 'chain_key.freezed.dart';
part 'chain_key.g.dart';

/// Symmetric ratchet chain key.
///
/// Stepping seeds:
/// - `0x02` → next chain key.
/// - `0x01` → message key seed (then HKDF to derive 80 bytes).
const _messageKeySeed = 0x01;
const _chainKeySeed = 0x02;

@freezed
class ChainKey with _$ChainKey {
  const ChainKey._();

  const factory ChainKey({
    @Uint8ListConverter() required Uint8List key, // 32 bytes
    required int index,
  }) = _ChainKey;

  factory ChainKey.fromJson(Map<String, dynamic> json) =>
      _$ChainKeyFromJson(json);

  /// Derive the next chain key (HMAC-SHA256(key, 0x02)).
  Future<ChainKey> getNextChainKey() async {
    final hmac = Hmac.sha256();
    final mac = await hmac.calculateMac(
      Uint8List.fromList([_chainKeySeed]),
      secretKey: SecretKey(key),
    );
    return ChainKey(
      key: Uint8List.fromList(mac.bytes),
      index: index + 1,
    );
  }

  /// Derive message keys from the current chain key.
  ///
  /// Step 1: seed = HMAC-SHA256(key, 0x01)
  /// Step 2: HKDF-Expand(seed, info='WhisperMessage', 80)
  ///         → cipherKey[32] | macKey[32] | iv[16]
  Future<MessageKeys> getMessageKeys() async {
    final hmac = Hmac.sha256();
    final seedMac = await hmac.calculateMac(
      Uint8List.fromList([_messageKeySeed]),
      secretKey: SecretKey(key),
    );
    final seed = Uint8List.fromList(seedMac.bytes);

    // HKDF expand to 80 bytes.
    final info = Uint8List.fromList('WhisperMessage'.codeUnits);
    final expanded = await _hkdfExpand(seed, info, 80);

    final cipherKey = Uint8List.fromList(expanded.sublist(0, 32));
    final macKey = Uint8List.fromList(expanded.sublist(32, 64));
    final iv = Uint8List.fromList(expanded.sublist(64, 80)); // 16 bytes

    return MessageKeys(
      cipherKey: cipherKey,
      macKey: macKey,
      iv: iv,
      counter: index,
    );
  }

  /// RFC 5869 HKDF-Expand (counter starts at 1).
  static Future<Uint8List> _hkdfExpand(
      Uint8List prk, Uint8List info, int length) async {
    final hmac = Hmac.sha256();
    final hashLen = 32;
    final blocks = (length + hashLen - 1) ~/ hashLen;
    final okm = <int>[];
    Uint8List? previousBlock;

    final secretKey = SecretKey(prk);

    for (var i = 1; i <= blocks; i++) {
      final input = <int>[];
      if (previousBlock != null) input.addAll(previousBlock);
      input.addAll(info);
      input.add(i);

      final mac = await hmac.calculateMac(
        Uint8List.fromList(input),
        secretKey: secretKey,
      );
      previousBlock = Uint8List.fromList(mac.bytes);
      okm.addAll(mac.bytes);
    }

    return Uint8List.fromList(okm.sublist(0, length));
  }
}
