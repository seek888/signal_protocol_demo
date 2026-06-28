import '../session/session_record.dart';

/// Store interface for session records keyed by remote address.
abstract class SessionStore {
  Future<SessionRecord?> loadSession(String address);
  Future<void> storeSession(String address, SessionRecord record);
  Future<bool> containsSession(String address);
  Future<void> deleteSession(String address);
  Future<List<String>> getAllAddresses();
}
