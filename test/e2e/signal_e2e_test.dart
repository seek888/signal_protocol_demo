import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:signal_protocol_demo/domain/services/signal_session_service.dart';

void main() {
  late SignalSessionService service;

  setUp(() {
    service = SignalSessionService();
  });

  tearDown(() {
    service.reset();
  });

  group('Signal Session E2E', () {
    test('full handshake + encrypt/decrypt round trip', () async {
      // 1. Initialize identities
      await service.initializeIdentities();
      expect(service.aliceIdentityKeyHex, isNotNull);
      expect(service.bobIdentityKeyHex, isNotNull);
      expect(service.isInitialized, isTrue);

      // 2. X3DH handshake
      final sk = await service.performX3DHHandshake();
      expect(sk.length, 32);
      expect(service.sharedSecretHex, isNotNull);
      expect(service.isSessionEstablished, isTrue);

      // 3. Alice encrypts message
      final result = await service.encryptMessage('Hello Bob!');
      expect(result.plaintext, 'Hello Bob!');
      expect(result.ciphertext.length, greaterThan(28)); // nonce(12) + tag(16) + data
      expect(result.messageIndex, 0);

      // 4. Bob decrypts message
      final decrypted = await service.decryptMessage(result.ciphertext, 0);
      expect(decrypted, 'Hello Bob!');

      // 5. Second message
      final result2 = await service.encryptMessage('Second message');
      expect(result2.messageIndex, 1);
      final decrypted2 = await service.decryptMessage(result2.ciphertext, 1);
      expect(decrypted2, 'Second message');
    });

    test('multiple messages encrypt/decrypt correctly', () async {
      await service.performX3DHHandshake();

      final messages = ['Msg 1', 'Msg 2', 'Msg 3', 'Hello World', '加密测试'];
      final results = <EncryptedResult>[];

      for (final msg in messages) {
        results.add(await service.encryptMessage(msg));
      }

      // All ciphertexts should be different (forward secrecy)
      for (var i = 0; i < results.length; i++) {
        final decrypted = await service.decryptMessage(
          results[i].ciphertext,
          results[i].messageIndex,
        );
        expect(decrypted, messages[i],
            reason: 'Message $i failed to decrypt correctly');
      }

      // Verify ciphertexts are unique
      final ciphertextSet = results.map((r) => r.ciphertext.toString()).toSet();
      expect(ciphertextSet.length, messages.length,
          reason: 'Ciphertexts should all be unique');
    });

    test('step records are populated for visualization', () async {
      await service.performX3DHHandshake();
      await service.encryptMessage('test');

      final records = service.stepRecords;

      // Should have: alice_id, bob_id, ephemeral, dh1, dh2, dh3, hkdf, encrypt
      expect(records.length, greaterThanOrEqualTo(7));
      expect(records.any((r) => r.stepName == 'generate_alice_identity'), isTrue);
      expect(records.any((r) => r.stepName == 'generate_bob_identity'), isTrue);
      expect(records.any((r) => r.stepName == 'x3dh_dh1'), isTrue);
      expect(records.any((r) => r.stepName == 'x3dh_dh2'), isTrue);
      expect(records.any((r) => r.stepName == 'x3dh_dh3'), isTrue);
      expect(records.any((r) => r.stepName == 'x3dh_hkdf'), isTrue);
    });

    test('reset clears all state', () async {
      await service.performX3DHHandshake();
      expect(service.isSessionEstablished, isTrue);

      service.reset();
      expect(service.isInitialized, isFalse);
      expect(service.isSessionEstablished, isFalse);
      expect(service.stepRecords, isEmpty);
    });

    test('decrypt with wrong index throws', () async {
      await service.performX3DHHandshake();
      final result = await service.encryptMessage('test');

      // Decrypting with wrong index should fail
      expect(
        () => service.decryptMessage(result.ciphertext, 99),
        throwsA(anything),
      );
    });

    test('bidirectional: Bob can reply to Alice with separate chain', () async {
      await service.performX3DHHandshake();

      // Alice → Bob
      final aResult = await service.encryptMessage('Hello from Alice');
      expect(aResult.direction, MessageDirection.aliceToBob);
      final aDecrypted = await service.decryptMessage(
        aResult.ciphertext, aResult.messageIndex,
        direction: MessageDirection.aliceToBob,
      );
      expect(aDecrypted, 'Hello from Alice');

      // Bob → Alice (different chain key!)
      final bResult = await service.encryptMessage(
        'Hi Alice, message received!',
        direction: MessageDirection.bobToAlice,
      );
      expect(bResult.direction, MessageDirection.bobToAlice);
      expect(bResult.messageIndex, 0, reason: 'Bob chain starts from 0');
      final bDecrypted = await service.decryptMessage(
        bResult.ciphertext, bResult.messageIndex,
        direction: MessageDirection.bobToAlice,
      );
      expect(bDecrypted, 'Hi Alice, message received!');

      // Alice sends again — her chain continues independently
      final aResult2 = await service.encryptMessage('Another from Alice');
      expect(aResult2.messageIndex, 1, reason: 'Alice chain at index 1');
      final aDecrypted2 = await service.decryptMessage(
        aResult2.ciphertext, aResult2.messageIndex,
        direction: MessageDirection.aliceToBob,
      );
      expect(aDecrypted2, 'Another from Alice');

      // Bob sends again — his chain also continues
      final bResult2 = await service.encryptMessage(
        'Bob replies again',
        direction: MessageDirection.bobToAlice,
      );
      expect(bResult2.messageIndex, 1);
    });

    test('bidirectional keys are different between directions', () async {
      await service.performX3DHHandshake();

      final aResult = await service.encryptMessage('same text');
      final bResult = await service.encryptMessage(
        'same text',
        direction: MessageDirection.bobToAlice,
      );

      // Same plaintext, but ciphertext must differ (different keys)
      expect(aResult.ciphertext.toString(), isNot(bResult.ciphertext.toString()));
      expect(aResult.messageKey.toString(), isNot(bResult.messageKey.toString()));
    });
  });
}
