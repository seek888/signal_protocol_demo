import '../ecc/ec_key_pair.dart';

/// Store interface for signed PreKeys.
abstract class SignedPreKeyStore {
  Future<ECKeyPair?> getSignedPreKey(int id);
  Future<void> saveSignedPreKey(int id, ECKeyPair keyPair);
  Future<bool> containsSignedPreKey(int id);
  Future<void> removeSignedPreKey(int id);
}
