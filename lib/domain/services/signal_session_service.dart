import 'dart:convert';
import 'dart:typed_data';
import '../../core/crypto/aes_gcm.dart';
import '../../core/crypto/hkdf.dart';
import '../../core/crypto/curve25519.dart';
import '../../core/crypto/crypto_provider.dart';
import '../../core/ecc/ec_key_pair.dart';

/// 加密步骤记录（用于可视化）
class CryptoStepRecord {
  final String stepName;
  final String description;
  final Uint8List? input;
  final Uint8List? output;
  final DateTime timestamp;

  CryptoStepRecord({
    required this.stepName,
    required this.description,
    this.input,
    this.output,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();
}

/// Signal Protocol 会话服务
/// 管理完整的加密会话生命周期：X3DH 握手 → 消息收发
///
/// 在演示项目中，Alice 和 Bob 在同一设备上运行，
/// 通过 MockServerProvider 模拟网络通信。
class SignalSessionService {
  // 用户身份（X25519 密钥对）
  ECKeyPair? _aliceIdentity;
  ECKeyPair? _bobIdentity;

  // Ephemeral key
  ECKeyPair? _aliceEphemeral;

  // 共享密钥
  Uint8List? _sharedSecret;

  // 棘轮链密钥
  Uint8List? _aliceChainKey;
  int _aliceMessageNumber = 0;

  // 加密步骤记录（供可视化使用）
  final List<CryptoStepRecord> _stepRecords = [];
  List<CryptoStepRecord> get stepRecords => List.unmodifiable(_stepRecords);

  // Callback for real-time crypto events
  CryptoStepCallback? _callback;

  void setCallback(CryptoStepCallback? cb) {
    _callback = cb;
    Curve25519.callback = cb;
    HkdfSha256.callback = cb;
    Aes256Gcm.callback = cb;
  }

  /// 初始化 Alice 和 Bob 的身份
  Future<void> initializeIdentities() async {
    _stepRecords.clear();
    _aliceMessageNumber = 0;

    _aliceIdentity = await Curve25519.generateKeyPair();
    _stepRecords.add(CryptoStepRecord(
      stepName: 'generate_alice_identity',
      description: 'Generated Alice\'s Identity Key Pair (X25519)',
      output: _aliceIdentity!.publicKey,
    ));

    _bobIdentity = await Curve25519.generateKeyPair();
    _stepRecords.add(CryptoStepRecord(
      stepName: 'generate_bob_identity',
      description: 'Generated Bob\'s Identity Key Pair (X25519)',
      output: _bobIdentity!.publicKey,
    ));
  }

  /// 执行完整的 X3DH 握手
  /// 返回共享密钥
  Future<Uint8List> performX3DHHandshake() async {
    if (_aliceIdentity == null || _bobIdentity == null) {
      await initializeIdentities();
    }

    // Step 1: Alice generates ephemeral key
    _aliceEphemeral = await Curve25519.generateKeyPair();
    _stepRecords.add(CryptoStepRecord(
      stepName: 'x3dh_ephemeral',
      description: 'Alice generates ephemeral key EK_A',
      output: _aliceEphemeral!.publicKey,
    ));

    // DH1 = DH(IK_A, SPK_B) — using Bob's IK as SPK for demo
    final dh1 = await Curve25519.calculateAgreement(
      privateKey: _aliceIdentity!.privateKey,
      publicKey: _bobIdentity!.publicKey,
      label: 'DH1',
    );
    _stepRecords.add(CryptoStepRecord(
      stepName: 'x3dh_dh1',
      description: 'DH1 = DH(IK_A_priv, SPK_B_pub)',
      input: _aliceIdentity!.privateKey,
      output: dh1,
    ));

    // DH2 = DH(EK_A, IK_B)
    final dh2 = await Curve25519.calculateAgreement(
      privateKey: _aliceEphemeral!.privateKey,
      publicKey: _bobIdentity!.publicKey,
      label: 'DH2',
    );
    _stepRecords.add(CryptoStepRecord(
      stepName: 'x3dh_dh2',
      description: 'DH2 = DH(EK_A_priv, IK_B_pub)',
      input: _aliceEphemeral!.privateKey,
      output: dh2,
    ));

    // DH3 = DH(EK_A, SPK_B)
    final dh3 = await Curve25519.calculateAgreement(
      privateKey: _aliceEphemeral!.privateKey,
      publicKey: _bobIdentity!.publicKey,
      label: 'DH3',
    );
    _stepRecords.add(CryptoStepRecord(
      stepName: 'x3dh_dh3',
      description: 'DH3 = DH(EK_A_priv, SPK_B_pub)',
      input: _aliceEphemeral!.privateKey,
      output: dh3,
    ));

    // HKDF: SK = HKDF(0xFF×32 ‖ DH1 ‖ DH2 ‖ DH3)
    final combined = BytesBuilder();
    combined.add(Uint8List.fromList(List.filled(32, 0xFF)));
    combined.add(dh1);
    combined.add(dh2);
    combined.add(dh3);

    final sk = await HkdfSha256.deriveSecrets(
      ikm: combined.toBytes(),
      info: Uint8List(0),
      length: 32,
    );

    _sharedSecret = sk;
    _stepRecords.add(CryptoStepRecord(
      stepName: 'x3dh_hkdf',
      description: 'SK = HKDF(0xFF×32 ‖ DH1 ‖ DH2 ‖ DH3)',
      input: combined.toBytes(),
      output: sk,
    ));

    // Initialize chain key from shared secret
    _aliceChainKey = await HkdfSha256.deriveSecrets(
      ikm: sk,
      info: _stringToBytes('chain_key'),
      length: 32,
    );

    return sk;
  }

  /// 加密消息（Alice → Bob）
  Future<EncryptedResult> encryptMessage(String plaintext) async {
    if (_aliceChainKey == null) {
      throw StateError('Session not established. Call performX3DHHandshake() first.');
    }

    // Derive message key from current chain key
    final messageKey = await HkdfSha256.deriveSecrets(
      ikm: _aliceChainKey!,
      info: _stringToBytes('msg_$_aliceMessageNumber'),
      length: 32,
    );

    // Advance chain key
    _aliceChainKey = await HkdfSha256.deriveSecrets(
      ikm: _aliceChainKey!,
      info: _stringToBytes('chain_advance'),
      length: 32,
    );

    // Encrypt with AES-256-GCM
    final plaintextBytes = _stringToBytes(plaintext);
    final ciphertext = await Aes256Gcm.encrypt(
      key: messageKey,
      plaintext: plaintextBytes,
    );

    _stepRecords.add(CryptoStepRecord(
      stepName: 'encrypt_msg_$_aliceMessageNumber',
      description: 'AES-256-GCM encrypt message #$_aliceMessageNumber',
      input: plaintextBytes,
      output: ciphertext,
    ));

    final result = EncryptedResult(
      plaintext: plaintext,
      ciphertext: ciphertext,
      messageKey: messageKey,
      messageIndex: _aliceMessageNumber,
    );

    _aliceMessageNumber++;
    return result;
  }

  /// 解密消息（Bob 接收）
  Future<String> decryptMessage(Uint8List ciphertext, int messageIndex) async {
    if (_sharedSecret == null) {
      throw StateError('Session not established.');
    }

    // Re-derive chain key to the correct message index
    var chainKey = await HkdfSha256.deriveSecrets(
      ikm: _sharedSecret!,
      info: _stringToBytes('chain_key'),
      length: 32,
    );

    for (var i = 0; i < messageIndex; i++) {
      chainKey = await HkdfSha256.deriveSecrets(
        ikm: chainKey,
        info: _stringToBytes('chain_advance'),
        length: 32,
      );
    }

    final messageKey = await HkdfSha256.deriveSecrets(
      ikm: chainKey,
      info: _stringToBytes('msg_$messageIndex'),
      length: 32,
    );

    final plaintext = await Aes256Gcm.decrypt(
      key: messageKey,
      data: ciphertext,
    );

    _stepRecords.add(CryptoStepRecord(
      stepName: 'decrypt_msg_$messageIndex',
      description: 'AES-256-GCM decrypt message #$messageIndex',
      input: ciphertext,
      output: plaintext,
    ));

    return utf8.decode(plaintext);
  }

  // Getters for visualization
  String? get aliceIdentityKeyHex =>
      _aliceIdentity != null ? _bytesToHex(_stripPrefix(_aliceIdentity!.publicKey)) : null;

  String? get bobIdentityKeyHex =>
      _bobIdentity != null ? _bytesToHex(_stripPrefix(_bobIdentity!.publicKey)) : null;

  String? get sharedSecretHex =>
      _sharedSecret != null ? _bytesToHex(_sharedSecret!) : null;

  int get messageNumber => _aliceMessageNumber;

  bool get isInitialized => _aliceIdentity != null && _bobIdentity != null;
  bool get isSessionEstablished => _sharedSecret != null;

  /// 重置会话
  void reset() {
    _aliceIdentity = null;
    _bobIdentity = null;
    _aliceEphemeral = null;
    _sharedSecret = null;
    _aliceChainKey = null;
    _aliceMessageNumber = 0;
    _stepRecords.clear();
  }

  // Helpers
  Uint8List _stringToBytes(String s) => Uint8List.fromList(utf8.encode(s));
  Uint8List _stripPrefix(Uint8List key) =>
      key.length == 33 ? Uint8List.fromList(key.sublist(1)) : key;
  String _bytesToHex(Uint8List bytes) =>
      bytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join();
}

/// 加密结果
class EncryptedResult {
  final String plaintext;
  final Uint8List ciphertext;
  final Uint8List messageKey;
  final int messageIndex;

  EncryptedResult({
    required this.plaintext,
    required this.ciphertext,
    required this.messageKey,
    required this.messageIndex,
  });
}
