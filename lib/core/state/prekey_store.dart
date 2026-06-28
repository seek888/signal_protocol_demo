import '../ecc/ec_key_pair.dart';

/// Store interface for one-time PreKeys.
abstract class PreKeyStore {
  Future<ECKeyPair?> getPreKey(int id);
  Future<void> savePreKey(int id, ECKeyPair keyPair);
  Future<bool> containsPreKey(int id);
  Future<void> removePreKey(int id);
}
