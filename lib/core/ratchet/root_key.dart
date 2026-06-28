import 'dart:typed_data';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../util/uint8list_converter.dart';
import 'chain_key.dart';
import '../ecc/ec_key_pair.dart';
import '../crypto/curve25519.dart';
import '../crypto/hkdf.dart';

part 'root_key.freezed.dart';
part 'root_key.g.dart';

/// DH ratchet root key.
@freezed
class RootKey with _$RootKey {
  const RootKey._();

  const factory RootKey({
    @Uint8ListConverter() required Uint8List key, // 32 bytes
  }) = _RootKey;

  factory RootKey.fromJson(Map<String, dynamic> json) =>
      _$RootKeyFromJson(json);

  /// Perform a DH ratchet step:
  /// 1. dhOutput = DH(ourRatchet.private, theirRatchet.public)
  /// 2. (newRootKey, newChainKey) = HKDF(dhOutput, rootKey, info='WhisperRatchet')
  Future<(RootKey, ChainKey)> createChain({
    required Uint8List theirRatchetKey,
    required ECKeyPair ourRatchetKeyPair,
  }) async {
    // DH computation.
    final dhOutput = await Curve25519.calculateAgreement(
      privateKey: ourRatchetKeyPair.privateKey,
      publicKey: theirRatchetKey,
      label: 'DH_RATCHET',
    );

    // HKDF with rootKey as salt, dhOutput as IKM.
    final info = Uint8List.fromList('WhisperRatchet'.codeUnits);
    final derived = await HkdfSha256.deriveSecretsWithSalt(
      ikm: dhOutput,
      salt: key,
      info: info,
      length: 64, // 32 root + 32 chain
    );

    final newRootKey = RootKey(key: Uint8List.fromList(derived.sublist(0, 32)));
    final newChainKey = ChainKey(
      key: Uint8List.fromList(derived.sublist(32, 64)),
      index: 0,
    );

    return (newRootKey, newChainKey);
  }
}
