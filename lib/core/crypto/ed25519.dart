import 'dart:typed_data';
import 'package:cryptography/cryptography.dart';

/// Ed25519 signing and verification.
class Ed25519Wrapper {
  static final _ed25519 = Ed25519();

  /// Sign [message] with [privateKey] (32 raw bytes).
  /// Returns a 64-byte signature.
  ///
  /// Also requires the corresponding [publicKey] (32 raw bytes)
  /// because the cryptography package needs a full key pair.
  static Future<Uint8List> sign({
    required Uint8List privateKey,
    required Uint8List publicKey,
    required Uint8List message,
  }) async {
    final keyPairData = SimpleKeyPairData(
      privateKey,
      publicKey: SimplePublicKey(publicKey, type: KeyPairType.ed25519),
      type: KeyPairType.ed25519,
    );

    final signature = await _ed25519.sign(message, keyPair: keyPairData);
    return Uint8List.fromList(signature.bytes);
  }

  /// Verify a [signature] (64 bytes) over [message] using [publicKey]
  /// (32 raw bytes or 33 bytes with 0x05 prefix).
  static Future<bool> verify({
    required Uint8List publicKey,
    required Uint8List message,
    required Uint8List signature,
  }) async {
    final pubKeyBytes =
        publicKey.length == 33 ? publicKey.sublist(1) : publicKey;
    final sig = Signature(signature,
        publicKey:
            SimplePublicKey(pubKeyBytes, type: KeyPairType.ed25519));
    return _ed25519.verify(message, signature: sig);
  }
}
