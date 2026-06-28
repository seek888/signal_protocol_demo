import 'dart:typed_data';

/// 抽象服务端提供者接口
/// 定义所有与服务端交互的方法，支持 Mock 和 Remote 实现
abstract class IServerProvider {
  /// 注册用户，上传身份公钥
  Future<void> registerUser({
    required String userId,
    required Uint8List identityPublicKey,
  });

  /// 获取用户的身份公钥
  Future<Uint8List> getIdentityKey(String userId);

  /// 上传一次性预密钥（One-Time PreKeys）
  Future<void> uploadPreKeys({
    required String userId,
    required List<Map<String, dynamic>> preKeys,
  });

  /// 上传签名预密钥（Signed PreKey）
  Future<void> uploadSignedPreKey({
    required String userId,
    required Map<String, dynamic> signedPreKey,
  });

  /// 获取用户的 PreKey Bundle（用于初始化会话）
  /// 返回: {identityKey, signedPreKey, oneTimePreKey?, ...}
  Future<Map<String, dynamic>> fetchPreKeyBundle(String userId);

  /// 获取剩余的一次性预密钥数量
  Future<int> getPreKeyCount(String userId);

  /// 发送加密消息
  Future<void> sendMessage({
    required String recipientId,
    required Map<String, dynamic> envelope,
  });

  /// 获取待接收的消息列表
  Future<List<Map<String, dynamic>>> fetchMessages(String userId);

  /// 订阅实时消息推送（模拟 WebSocket）
  Stream<Map<String, dynamic>> subscribeMessages(String userId);

  /// 健康检查
  Future<bool> healthCheck();
}
