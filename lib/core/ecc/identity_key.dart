import 'dart:typed_data';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../util/uint8list_converter.dart';

part 'identity_key.freezed.dart';
part 'identity_key.g.dart';

/// A public identity key (Ed25519 public key).
@freezed
class IdentityKey with _$IdentityKey {
  const factory IdentityKey({
    @Uint8ListConverter() required Uint8List publicKey,
  }) = _IdentityKey;

  factory IdentityKey.fromJson(Map<String, dynamic> json) =>
      _$IdentityKeyFromJson(json);
}
