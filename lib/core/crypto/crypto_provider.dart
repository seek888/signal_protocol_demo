import 'dart:typed_data';

/// Callback interface for subscribing to crypto operations (for visualisation).
abstract class CryptoStepCallback {
  void onDHCompute(DHOperation operation);
  void onHKDFDerive(HKDFDerivation derivation);
  void onRatchetStep(RatchetStepEvent event);
  void onAESEncrypt(AESEncryptionEvent event);
  void onAESDecrypt(AESDecryptionEvent event);
}

/// Event data for a Diffie–Hellman operation.
class DHOperation {
  final String label;
  final Uint8List privateKey;
  final Uint8List publicKey;
  final Uint8List output;

  DHOperation({
    required this.label,
    required this.privateKey,
    required this.publicKey,
    required this.output,
  });
}

/// Event data for an HKDF derivation.
class HKDFDerivation {
  final Uint8List input;
  final Uint8List? salt;
  final Uint8List info;
  final int length;
  final Uint8List output;

  HKDFDerivation({
    required this.input,
    this.salt,
    required this.info,
    required this.length,
    required this.output,
  });
}

/// Event data for a ratchet step.
class RatchetStepEvent {
  final String type;
  final Map<String, dynamic> details;

  RatchetStepEvent({required this.type, required this.details});
}

/// Event data for an AES encryption.
class AESEncryptionEvent {
  final Uint8List key;
  final Uint8List nonce;
  final Uint8List plaintext;
  final Uint8List ciphertext;

  AESEncryptionEvent({
    required this.key,
    required this.nonce,
    required this.plaintext,
    required this.ciphertext,
  });
}

/// Event data for an AES decryption.
class AESDecryptionEvent {
  final Uint8List key;
  final Uint8List nonce;
  final Uint8List ciphertext;
  final Uint8List plaintext;

  AESDecryptionEvent({
    required this.key,
    required this.nonce,
    required this.ciphertext,
    required this.plaintext,
  });
}
