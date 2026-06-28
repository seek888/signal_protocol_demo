import 'dart:typed_data';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../util/uint8list_converter.dart';

part 'identity_key_pair.freezed.dart';
part 'identity_key_pair.g.dart';

/// An identity key pair: Ed25519 signing key + Curve25519 derived public key.
@freezed
class IdentityKeyPair with _$IdentityKeyPair {
  const factory IdentityKeyPair({
    @Uint8ListConverter() required Uint8List publicKey,
    @Uint8ListConverter() required Uint8List privateKey,
  }) = _IdentityKeyPair;

  factory IdentityKeyPair.fromJson(Map<String, dynamic> json) =>
      _$IdentityKeyPairFromJson(json);
}
