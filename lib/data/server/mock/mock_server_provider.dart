import 'dart:async';
import 'dart:typed_data';
import '../iserver_provider.dart';
import 'mock_server_state.dart';

class MockServerProvider implements IServerProvider {
  final MockServerState _state = MockServerState();
  final Duration _networkDelay = const Duration(milliseconds: 100);

  Future<void> _simulateNetworkDelay() async {
    await Future.delayed(_networkDelay);
  }

  @override
  Future<void> registerUser({
    required String userId,
    required Uint8List identityPublicKey,
  }) async {
    await _simulateNetworkDelay();
    _state.registerUser(userId, identityPublicKey);
  }

  @override
  Future<Uint8List> getIdentityKey(String userId) async {
    await _simulateNetworkDelay();
    final key = _state.getIdentityKey(userId);
    if (key == null) {
      throw Exception('User not found: $userId');
    }
    return key;
  }

  @override
  Future<void> uploadPreKeys({
    required String userId,
    required List<Map<String, dynamic>> preKeys,
  }) async {
    await _simulateNetworkDelay();
    _state.uploadPreKeys(userId, preKeys);
  }

  @override
  Future<void> uploadSignedPreKey({
    required String userId,
    required Map<String, dynamic> signedPreKey,
  }) async {
    await _simulateNetworkDelay();
    _state.uploadSignedPreKey(userId, signedPreKey);
  }

  @override
  Future<Map<String, dynamic>> fetchPreKeyBundle(String userId) async {
    await _simulateNetworkDelay();
    final bundle = _state.fetchPreKeyBundle(userId);
    if (bundle == null) {
      throw Exception('No prekey bundle available for user: $userId');
    }
    return bundle;
  }

  @override
  Future<int> getPreKeyCount(String userId) async {
    await _simulateNetworkDelay();
    return _state.getPreKeyCount(userId);
  }

  @override
  Future<void> sendMessage({
    required String recipientId,
    required Map<String, dynamic> envelope,
  }) async {
    await _simulateNetworkDelay();
    _state.sendMessage(recipientId, envelope);
  }

  @override
  Future<List<Map<String, dynamic>>> fetchMessages(String userId) async {
    await _simulateNetworkDelay();
    return _state.fetchMessages(userId);
  }

  @override
  Stream<Map<String, dynamic>> subscribeMessages(String userId) {
    return _state.subscribeMessages(userId);
  }

  @override
  Future<bool> healthCheck() async {
    await _simulateNetworkDelay();
    return true;
  }

  void clearAllData() {
    _state.clear();
  }
}
