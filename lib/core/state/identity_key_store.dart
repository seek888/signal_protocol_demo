import 'dart:typed_data';
import '../ecc/identity_key_pair.dart';

/// Store interface for identity keys.
abstract class IdentityKeyStore {
  /// Get the identity key pair for the local user.
  Future<IdentityKeyPair> getIdentityKeyPair();

  /// Get the identity key for a remote [address].
  Future<Uint8List?> getIdentity(String address);

  /// Save the identity key for [address].
  /// Returns `true` if the identity is new or changed.
  Future<bool> saveIdentity(String address, Uint8List identityKey);

  /// Check whether [identityKey] is trusted for [address].
  Future<bool> isTrustedIdentity(String address, Uint8List identityKey);
}
