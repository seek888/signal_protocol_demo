import 'dart:typed_data';
import 'package:cryptography/cryptography.dart';
import 'crypto_provider.dart';

/// AES-256-GCM encryption / decryption helper.
///
/// The [encrypt] output layout is: nonce[12] | ciphertext | tag[16].
class Aes256Gcm {
  static const _nonceLength = 12;
  static const _tagLength = 16;
  static final _algo = AesGcm.with256bits();

  /// Global callback for AES events.
  static CryptoStepCallback? callback;

  /// Encrypt [plaintext] with a 32-byte [key].
  /// Returns nonce || ciphertext || tag.
  static Future<Uint8List> encrypt({
    required Uint8List key,
    required Uint8List plaintext,
  }) async {
    // Generate a random 12-byte nonce.
    final nonce = _algo.newNonce();
    final secretKey = SecretKey(key);
    final secretBox = await _algo.encrypt(
      plaintext,
      secretKey: secretKey,
      nonce: nonce,
    );

    // Combine: nonce + ciphertext + tag
    final output = Uint8List(_nonceLength + secretBox.cipherText.length + _tagLength);
    output.setRange(0, _nonceLength, nonce);
    output.setRange(_nonceLength, _nonceLength + secretBox.cipherText.length,
        secretBox.cipherText);
    output.setRange(
        _nonceLength + secretBox.cipherText.length, output.length, secretBox.mac.bytes);

    callback?.onAESEncrypt(AESEncryptionEvent(
      key: key,
      nonce: Uint8List.fromList(nonce),
      plaintext: plaintext,
      ciphertext: output,
    ));

    return output;
  }

  /// Decrypt data produced by [encrypt].
  /// [data] = nonce[12] | ciphertext | tag[16].
  static Future<Uint8List> decrypt({
    required Uint8List key,
    required Uint8List data,
  }) async {
    if (data.length < _nonceLength + _tagLength) {
      throw ArgumentError('Ciphertext too short: ${data.length}');
    }

    final nonce = data.sublist(0, _nonceLength);
    final cipherText = data.sublist(_nonceLength, data.length - _tagLength);
    final mac = Mac(data.sublist(data.length - _tagLength));

    final secretBox = SecretBox(
      cipherText,
      nonce: nonce,
      mac: mac,
    );

    final plaintext = await _algo.decrypt(
      secretBox,
      secretKey: SecretKey(key),
    );

    callback?.onAESDecrypt(AESDecryptionEvent(
      key: key,
      nonce: Uint8List.fromList(nonce),
      ciphertext: data,
      plaintext: Uint8List.fromList(plaintext),
    ));

    return Uint8List.fromList(plaintext);
  }
}
