import 'dart:typed_data';
import 'package:cryptography/cryptography.dart';
import 'crypto_provider.dart';

/// HKDF-SHA256 implementation (RFC 5869).
///
/// Implements the v3 variant where iteration counter starts at 1.
class HkdfSha256 {
  static final _hmac = Hmac.sha256();
  static final _hashLength = 32;

  /// Global callback for HKDF events.
  static CryptoStepCallback? callback;

  /// Derive [length] bytes from [ikm] using [info] with a zero salt.
  static Future<Uint8List> deriveSecrets({
    required Uint8List ikm,
    required Uint8List info,
    required int length,
  }) async {
    final salt = Uint8List(_hashLength); // all-zero salt
    return deriveSecretsWithSalt(
      ikm: ikm,
      salt: salt,
      info: info,
      length: length,
    );
  }

  /// Derive [length] bytes from [ikm] and [salt] using [info].
  static Future<Uint8List> deriveSecretsWithSalt({
    required Uint8List ikm,
    required Uint8List salt,
    required Uint8List info,
    required int length,
  }) async {
    // Extract
    final prk = await _extract(ikm, salt);

    // Expand
    final output = await _expand(prk, info, length);

    callback?.onHKDFDerive(HKDFDerivation(
      input: ikm,
      salt: salt,
      info: info,
      length: length,
      output: output,
    ));

    return output;
  }

  /// HKDF-Extract: PRK = HMAC-SHA256(salt, IKM)
  static Future<Uint8List> _extract(
      Uint8List ikm, Uint8List salt) async {
    final mac = await _hmac.calculateMac(
      ikm,
      secretKey: SecretKey(salt),
    );
    return Uint8List.fromList(mac.bytes);
  }

  /// HKDF-Expand (RFC 5869, v3 – counter starts at 1).
  ///
  /// T(N) = T(0) | T(1) | ...
  /// T(i) = HMAC-SHA256(PRK, T(i-1) | info | i)   where i starts at 1.
  static Future<Uint8List> _expand(
      Uint8List prk, Uint8List info, int length) async {
    final secretKey = SecretKey(prk);
    final blocks = (length + _hashLength - 1) ~/ _hashLength;
    final okm = <int>[];
    Uint8List? previousBlock;

    for (var i = 1; i <= blocks; i++) {
      final input = <int>[];
      if (previousBlock != null) {
        input.addAll(previousBlock);
      }
      input.addAll(info);
      input.add(i);

      final mac = await _hmac.calculateMac(
        Uint8List.fromList(input),
        secretKey: secretKey,
      );
      previousBlock = Uint8List.fromList(mac.bytes);
      okm.addAll(mac.bytes);
    }

    return Uint8List.fromList(okm.sublist(0, length));
  }
}
