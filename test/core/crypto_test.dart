import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/foundation.dart';
import 'package:signal_protocol_demo/core/crypto/curve25519.dart';
import 'package:signal_protocol_demo/core/crypto/hkdf.dart';
import 'package:signal_protocol_demo/core/crypto/aes_gcm.dart';

void main() {
  group('Curve25519', () {
    test('generateKeyPair produces valid key pair', () async {
      final pair = await Curve25519.generateKeyPair();

      expect(pair.publicKey.length, 33);
      expect(pair.publicKey[0], 0x05);
      expect(pair.privateKey.length, 32);
    });

    test('calculateAgreement produces same shared secret', () async {
      final alice = await Curve25519.generateKeyPair();
      final bob = await Curve25519.generateKeyPair();

      final aliceSecret = await Curve25519.calculateAgreement(
        privateKey: alice.privateKey,
        publicKey: bob.publicKey,
        label: 'test-alice',
      );

      final bobSecret = await Curve25519.calculateAgreement(
        privateKey: bob.privateKey,
        publicKey: alice.publicKey,
        label: 'test-bob',
      );

      expect(aliceSecret.length, 32);
      expect(bobSecret.length, 32);
      expect(listEquals(aliceSecret, bobSecret), isTrue);
    });

    test('serialize and deserialize public key', () async {
      final pair = await Curve25519.generateKeyPair();
      final raw = Curve25519.deserializePublicKey(pair.publicKey);
      expect(raw.length, 32);

      final reSerialized = Curve25519.serializePublicKey(raw);
      expect(listEquals(reSerialized, pair.publicKey), isTrue);
    });
  });

  group('HKDF', () {
    test('deriveSecrets produces correct length output', () async {
      final ikm = Uint8List.fromList(List.filled(32, 0x0A));
      final info = Uint8List.fromList('test'.codeUnits);

      final output = await HkdfSha256.deriveSecrets(
        ikm: ikm,
        info: info,
        length: 64,
      );

      expect(output.length, 64);
    });

    test('deriveSecrets is deterministic', () async {
      final ikm = Uint8List.fromList(List.filled(32, 0x0B));
      final info = Uint8List.fromList('deterministic'.codeUnits);

      final out1 = await HkdfSha256.deriveSecrets(
          ikm: ikm, info: info, length: 32);
      final out2 = await HkdfSha256.deriveSecrets(
          ikm: ikm, info: info, length: 32);

      expect(listEquals(out1, out2), isTrue);
    });

    test('different info produces different output', () async {
      final ikm = Uint8List.fromList(List.filled(32, 0x0C));

      final out1 = await HkdfSha256.deriveSecrets(
        ikm: ikm,
        info: Uint8List.fromList('info1'.codeUnits),
        length: 32,
      );
      final out2 = await HkdfSha256.deriveSecrets(
        ikm: ikm,
        info: Uint8List.fromList('info2'.codeUnits),
        length: 32,
      );

      expect(listEquals(out1, out2), isFalse);
    });

    test('with salt differs from without salt', () async {
      final ikm = Uint8List.fromList(List.filled(32, 0x0D));

      final noSalt = await HkdfSha256.deriveSecrets(
        ikm: ikm,
        info: Uint8List.fromList('test'.codeUnits),
        length: 32,
      );

      final withSalt = await HkdfSha256.deriveSecretsWithSalt(
        ikm: ikm,
        salt: Uint8List.fromList(List.filled(32, 0xFF)),
        info: Uint8List.fromList('test'.codeUnits),
        length: 32,
      );

      expect(listEquals(noSalt, withSalt), isFalse);
    });
  });

  group('AES-256-GCM', () {
    test('encrypt and decrypt round trip', () async {
      final key = Uint8List.fromList(List.filled(32, 0x42));
      final plaintext =
          Uint8List.fromList('Hello Signal Protocol!'.codeUnits);

      final encrypted = await Aes256Gcm.encrypt(
        key: key,
        plaintext: plaintext,
      );

      // nonce(12) + ciphertext + tag(16)
      expect(encrypted.length, 12 + plaintext.length + 16);

      final decrypted = await Aes256Gcm.decrypt(
        key: key,
        data: encrypted,
      );

      expect(listEquals(decrypted, plaintext), isTrue);
    });

    test('different encryptions use different nonces', () async {
      final key = Uint8List.fromList(List.filled(32, 0x42));
      final plaintext = Uint8List.fromList('test message'.codeUnits);

      final enc1 = await Aes256Gcm.encrypt(key: key, plaintext: plaintext);
      final enc2 = await Aes256Gcm.encrypt(key: key, plaintext: plaintext);

      // Nonces should differ (random generation).
      final nonce1 = enc1.sublist(0, 12);
      final nonce2 = enc2.sublist(0, 12);
      expect(listEquals(nonce1, nonce2), isFalse);
    });

    test('decrypt with wrong key throws', () async {
      final key = Uint8List.fromList(List.filled(32, 0x42));
      final wrongKey = Uint8List.fromList(List.filled(32, 0x99));
      final plaintext = Uint8List.fromList('secret'.codeUnits);

      final encrypted = await Aes256Gcm.encrypt(
        key: key,
        plaintext: plaintext,
      );

      expect(
        () => Aes256Gcm.decrypt(key: wrongKey, data: encrypted),
        throwsA(anything),
      );
    });
  });
}
