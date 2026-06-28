import 'dart:typed_data';
import '../ecc/ec_key_pair.dart';
import '../ecc/identity_key_pair.dart';
import '../crypto/curve25519.dart';
import 'identity_key_store.dart';
import 'prekey_store.dart';
import 'signed_prekey_store.dart';
import 'session_store.dart';
import '../session/session_record.dart';

/// In-memory implementation of all four store interfaces — for demos and tests.
class InMemoryIdentityKeyStore implements IdentityKeyStore {
  final Map<String, Uint8List> _identities = {};
  IdentityKeyPair? _local;

  @override
  Future<IdentityKeyPair> getIdentityKeyPair() async {
    _local ??= await _generateIdentity();
    return _local!;
  }

  @override
  Future<Uint8List?> getIdentity(String address) =>
      Future.value(_identities[address]);

  @override
  Future<bool> saveIdentity(String address, Uint8List identityKey) async {
    final existing = _identities[address];
    _identities[address] = identityKey;
    return existing == null || !_bytesEqual(existing, identityKey);
  }

  @override
  Future<bool> isTrustedIdentity(String address, Uint8List identityKey) async {
    final existing = _identities[address];
    if (existing == null) return true; // trust on first use
    return _bytesEqual(existing, identityKey);
  }

  static bool _bytesEqual(Uint8List a, Uint8List b) {
    if (a.length != b.length) return false;
    for (var i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }

  Future<IdentityKeyPair> _generateIdentity() async {
    final pair = await Curve25519.generateKeyPair();
    return IdentityKeyPair(
      publicKey: pair.publicKey,
      privateKey: pair.privateKey,
    );
  }
}

class InMemoryPreKeyStore implements PreKeyStore {
  final Map<int, ECKeyPair> _store = {};

  @override
  Future<ECKeyPair?> getPreKey(int id) => Future.value(_store[id]);

  @override
  Future<void> savePreKey(int id, ECKeyPair keyPair) async {
    _store[id] = keyPair;
  }

  @override
  Future<bool> containsPreKey(int id) => Future.value(_store.containsKey(id));

  @override
  Future<void> removePreKey(int id) async {
    _store.remove(id);
  }
}

class InMemorySignedPreKeyStore implements SignedPreKeyStore {
  final Map<int, ECKeyPair> _store = {};

  @override
  Future<ECKeyPair?> getSignedPreKey(int id) => Future.value(_store[id]);

  @override
  Future<void> saveSignedPreKey(int id, ECKeyPair keyPair) async {
    _store[id] = keyPair;
  }

  @override
  Future<bool> containsSignedPreKey(int id) =>
      Future.value(_store.containsKey(id));

  @override
  Future<void> removeSignedPreKey(int id) async {
    _store.remove(id);
  }
}

class InMemorySessionStore implements SessionStore {
  final Map<String, SessionRecord> _store = {};

  @override
  Future<SessionRecord?> loadSession(String address) =>
      Future.value(_store[address]);

  @override
  Future<void> storeSession(String address, SessionRecord record) async {
    _store[address] = record;
  }

  @override
  Future<bool> containsSession(String address) =>
      Future.value(_store.containsKey(address));

  @override
  Future<void> deleteSession(String address) async {
    _store.remove(address);
  }

  @override
  Future<List<String>> getAllAddresses() =>
      Future.value(_store.keys.toList());
}
