import 'dart:async';
import 'dart:typed_data';

class MockServerState {
  final Map<String, Uint8List> _identityKeys = {};
  final Map<String, Map<String, dynamic>> _signedPreKeys = {};
  final Map<String, List<Map<String, dynamic>>> _oneTimePreKeys = {};
  final Map<String, List<Map<String, dynamic>>> _messageQueues = {};
  final Map<String, StreamController<Map<String, dynamic>>> _messageStreams = {};

  void registerUser(String userId, Uint8List identityPublicKey) {
    _identityKeys[userId] = identityPublicKey;
    _oneTimePreKeys[userId] = [];
    _messageQueues[userId] = [];
  }

  Uint8List? getIdentityKey(String userId) {
    return _identityKeys[userId];
  }

  void uploadPreKeys(String userId, List<Map<String, dynamic>> preKeys) {
    _oneTimePreKeys[userId] = [
      ...(_oneTimePreKeys[userId] ?? []),
      ...preKeys,
    ];
  }

  void uploadSignedPreKey(String userId, Map<String, dynamic> signedPreKey) {
    _signedPreKeys[userId] = signedPreKey;
  }

  Map<String, dynamic>? fetchPreKeyBundle(String userId) {
    final identityKey = _identityKeys[userId];
    final signedPreKey = _signedPreKeys[userId];

    if (identityKey == null || signedPreKey == null) {
      return null;
    }

    final bundle = <String, dynamic>{
      'identityKey': identityKey,
      'signedPreKey': signedPreKey,
    };

    final oneTimePreKeys = _oneTimePreKeys[userId];
    if (oneTimePreKeys != null && oneTimePreKeys.isNotEmpty) {
      bundle['oneTimePreKey'] = oneTimePreKeys.removeAt(0);
    }

    return bundle;
  }

  int getPreKeyCount(String userId) {
    return _oneTimePreKeys[userId]?.length ?? 0;
  }

  void sendMessage(String recipientId, Map<String, dynamic> envelope) {
    if (!_messageQueues.containsKey(recipientId)) {
      _messageQueues[recipientId] = [];
    }
    _messageQueues[recipientId]!.add(envelope);

    if (_messageStreams.containsKey(recipientId)) {
      _messageStreams[recipientId]!.add(envelope);
    }
  }

  List<Map<String, dynamic>> fetchMessages(String userId) {
    final messages = _messageQueues[userId] ?? [];
    _messageQueues[userId] = [];
    return messages;
  }

  Stream<Map<String, dynamic>> subscribeMessages(String userId) {
    if (!_messageStreams.containsKey(userId)) {
      _messageStreams[userId] = StreamController<Map<String, dynamic>>.broadcast();
    }
    return _messageStreams[userId]!.stream;
  }

  void clear() {
    _identityKeys.clear();
    _signedPreKeys.clear();
    _oneTimePreKeys.clear();
    _messageQueues.clear();
    for (final controller in _messageStreams.values) {
      controller.close();
    }
    _messageStreams.clear();
  }
}
