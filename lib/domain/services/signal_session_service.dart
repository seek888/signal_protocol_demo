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

/// 通信方向
enum MessageDirection { aliceToBob, bobToAlice }

/// 单方向的棘轮链
class _RatchetChain {
  Uint8List? chainKey;
  int messageNumber = 0;

  void init(Uint8List rootSecret, String label) {
    // 同步初始化会用，但这里是异步的，所以在外部调用 init
  }

  Future<void> initFromRoot(Uint8List rootSecret, String label) async {
    chainKey = await HkdfSha256.deriveSecrets(
      ikm: rootSecret,
      info: Uint8List.fromList(utf8.encode(label)),
      length: 32,
    );
    messageNumber = 0;
  }

  void reset() {
    chainKey = null;
    messageNumber = 0;
  }

  bool get isReady => chainKey != null;
}

/// Signal Protocol 会话服务
/// 管理完整的加密会话生命周期：X3DH 握手 → 双向消息收发
///
/// 支持 Alice→Bob 和 Bob→Alice 双向通信。
/// 每个方向维护独立的 chain key，前向保密。
class SignalSessionService {
  // 用户身份（X25519 密钥对）
  ECKeyPair? _aliceIdentity;
  ECKeyPair? _bobIdentity;

  // Ephemeral key
  ECKeyPair? _aliceEphemeral;

  // 共享密钥（Root Key）
  Uint8List? _rootKey;

  // 双向棘轮链
  final _aliceChain = _RatchetChain(); // Alice 发送链
  final _bobChain = _RatchetChain();   // Bob 发送链

  // 接收方缓存：每个方向的 message key 列表（用于解密历史消息）
  final Map<MessageDirection, Map<int, Uint8List>> _messageKeyCache = {
    MessageDirection.aliceToBob: {},
    MessageDirection.bobToAlice: {},
  };

  // 加密步骤记录（供可视化使用）
  final List<CryptoStepRecord> _stepRecords = [];
  List<CryptoStepRecord> get stepRecords => List.unmodifiable(_stepRecords);

  /// Set crypto step callback for visualization
  void setCallback(CryptoStepCallback? cb) {
    Curve25519.callback = cb;
    HkdfSha256.callback = cb;
    Aes256Gcm.callback = cb;
  }

  /// 初始化 Alice 和 Bob 的身份
  Future<void> initializeIdentities() async {
    _stepRecords.clear();

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

    _rootKey = sk;
    _stepRecords.add(CryptoStepRecord(
      stepName: 'x3dh_hkdf',
      description: 'SK = HKDF(0xFF×32 ‖ DH1 ‖ DH2 ‖ DH3)',
      input: combined.toBytes(),
      output: sk,
    ));

    // 初始化两条方向的链
    await _aliceChain.initFromRoot(sk, 'alice_to_bob_chain');
    await _bobChain.initFromRoot(sk, 'bob_to_alice_chain');

    _stepRecords.add(CryptoStepRecord(
      stepName: 'init_chains',
      description: 'Initialized bidirectional chains: Alice→Bob & Bob→Alice',
      output: sk,
    ));

    return sk;
  }

  /// 加密消息（支持双向）
  /// [direction] 指定发送方向
  Future<EncryptedResult> encryptMessage(
    String plaintext, {
    MessageDirection direction = MessageDirection.aliceToBob,
  }) async {
    final chain = direction == MessageDirection.aliceToBob ? _aliceChain : _bobChain;
    final dirLabel = direction == MessageDirection.aliceToBob ? 'A→B' : 'B→A';

    if (chain.chainKey == null) {
      throw StateError('Session not established. Call performX3DHHandshake() first.');
    }

    // 从当前 chain key 派生 message key
    final messageKey = await HkdfSha256.deriveSecrets(
      ikm: chain.chainKey!,
      info: Uint8List.fromList(utf8.encode('msg_${chain.messageNumber}')),
      length: 32,
    );

    // 缓存 message key（接收方解密时可用）
    _messageKeyCache[direction]![chain.messageNumber] = messageKey;

    // 推进 chain key（前向保密）
    chain.chainKey = await HkdfSha256.deriveSecrets(
      ikm: chain.chainKey!,
      info: Uint8List.fromList(utf8.encode('chain_advance')),
      length: 32,
    );

    // AES-256-GCM 加密
    final plaintextBytes = Uint8List.fromList(utf8.encode(plaintext));
    final ciphertext = await Aes256Gcm.encrypt(
      key: messageKey,
      plaintext: plaintextBytes,
    );

    final msgIndex = chain.messageNumber;

    _stepRecords.add(CryptoStepRecord(
      stepName: 'encrypt_${dirLabel}_msg_$msgIndex',
      description: '[$dirLabel] AES-256-GCM encrypt message #$msgIndex',
      input: plaintextBytes,
      output: ciphertext,
    ));

    chain.messageNumber++;

    return EncryptedResult(
      plaintext: plaintext,
      ciphertext: ciphertext,
      messageKey: messageKey,
      messageIndex: msgIndex,
      direction: direction,
    );
  }

  /// 解密消息（支持双向）
  /// [direction] 指定消息来源方向
  Future<String> decryptMessage(
    Uint8List ciphertext,
    int messageIndex, {
    MessageDirection direction = MessageDirection.aliceToBob,
  }) async {
    if (_rootKey == null) {
      throw StateError('Session not established.');
    }

    final dirLabel = direction == MessageDirection.aliceToBob ? 'A→B' : 'B→A';

    // 尝试从缓存获取 message key
    Uint8List? messageKey = _messageKeyCache[direction]?[messageIndex];

    if (messageKey == null) {
      // 重新派生到指定 index
      final initLabel = direction == MessageDirection.aliceToBob
          ? 'alice_to_bob_chain'
          : 'bob_to_alice_chain';

      var chainKey = await HkdfSha256.deriveSecrets(
        ikm: _rootKey!,
        info: Uint8List.fromList(utf8.encode(initLabel)),
        length: 32,
      );

      for (var i = 0; i < messageIndex; i++) {
        chainKey = await HkdfSha256.deriveSecrets(
          ikm: chainKey,
          info: Uint8List.fromList(utf8.encode('chain_advance')),
          length: 32,
        );
      }

      messageKey = await HkdfSha256.deriveSecrets(
        ikm: chainKey,
        info: Uint8List.fromList(utf8.encode('msg_$messageIndex')),
        length: 32,
      );

      _messageKeyCache[direction]![messageIndex] = messageKey;
    }

    final plaintext = await Aes256Gcm.decrypt(
      key: messageKey,
      data: ciphertext,
    );

    _stepRecords.add(CryptoStepRecord(
      stepName: 'decrypt_${dirLabel}_msg_$messageIndex',
      description: '[$dirLabel] AES-256-GCM decrypt message #$messageIndex',
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
      _rootKey != null ? _bytesToHex(_rootKey!) : null;

  int get aliceMessageCount => _aliceChain.messageNumber;
  int get bobMessageCount => _bobChain.messageNumber;
  int get totalMessageCount => _aliceChain.messageNumber + _bobChain.messageNumber;

  bool get isInitialized => _aliceIdentity != null && _bobIdentity != null;
  bool get isSessionEstablished => _rootKey != null;

  /// 重置会话
  void reset() {
    _aliceIdentity = null;
    _bobIdentity = null;
    _aliceEphemeral = null;
    _rootKey = null;
    _aliceChain.reset();
    _bobChain.reset();
    _messageKeyCache[MessageDirection.aliceToBob]!.clear();
    _messageKeyCache[MessageDirection.bobToAlice]!.clear();
    _stepRecords.clear();
  }

  // Helpers
  String _bytesToHex(Uint8List bytes) =>
      bytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join();
  Uint8List _stripPrefix(Uint8List key) =>
      key.length == 33 ? Uint8List.fromList(key.sublist(1)) : key;
}

/// 加密结果
class EncryptedResult {
  final String plaintext;
  final Uint8List ciphertext;
  final Uint8List messageKey;
  final int messageIndex;
  final MessageDirection direction;

  EncryptedResult({
    required this.plaintext,
    required this.ciphertext,
    required this.messageKey,
    required this.messageIndex,
    this.direction = MessageDirection.aliceToBob,
  });
}
