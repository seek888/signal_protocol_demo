import 'dart:typed_data';

/// 加密会话信息
class SessionInfo {
  final String remoteUserId;
  final Uint8List sharedSecret;
  final DateTime establishedAt;
  final int messageCount;

  SessionInfo({
    required this.remoteUserId,
    required this.sharedSecret,
    required this.establishedAt,
    this.messageCount = 0,
  });

  SessionInfo copyWith({
    String? remoteUserId,
    Uint8List? sharedSecret,
    DateTime? establishedAt,
    int? messageCount,
  }) {
    return SessionInfo(
      remoteUserId: remoteUserId ?? this.remoteUserId,
      sharedSecret: sharedSecret ?? this.sharedSecret,
      establishedAt: establishedAt ?? this.establishedAt,
      messageCount: messageCount ?? this.messageCount,
    );
  }
}

/// 加密后的消息信封
class EncryptedEnvelope {
  final String senderId;
  final String recipientId;
  final Uint8List ciphertext;
  final Uint8List nonce;
  final int messageIndex;
  final DateTime timestamp;

  EncryptedEnvelope({
    required this.senderId,
    required this.recipientId,
    required this.ciphertext,
    required this.nonce,
    required this.messageIndex,
    required this.timestamp,
  });

  Map<String, dynamic> toJson() => {
        'senderId': senderId,
        'recipientId': recipientId,
        'ciphertext': ciphertext.toList(),
        'nonce': nonce.toList(),
        'messageIndex': messageIndex,
        'timestamp': timestamp.toIso8601String(),
      };

  factory EncryptedEnvelope.fromJson(Map<String, dynamic> json) {
    return EncryptedEnvelope(
      senderId: json['senderId'] as String,
      recipientId: json['recipientId'] as String,
      ciphertext:
          Uint8List.fromList((json['ciphertext'] as List).cast<int>()),
      nonce: Uint8List.fromList((json['nonce'] as List).cast<int>()),
      messageIndex: json['messageIndex'] as int,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );
  }
}
