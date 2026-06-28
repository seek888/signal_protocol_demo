// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'identity_key_pair.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IdentityKeyPairImpl _$$IdentityKeyPairImplFromJson(
  Map<String, dynamic> json,
) => _$IdentityKeyPairImpl(
  publicKey: const Uint8ListConverter().fromJson(json['publicKey'] as String),
  privateKey: const Uint8ListConverter().fromJson(json['privateKey'] as String),
);

Map<String, dynamic> _$$IdentityKeyPairImplToJson(
  _$IdentityKeyPairImpl instance,
) => <String, dynamic>{
  'publicKey': const Uint8ListConverter().toJson(instance.publicKey),
  'privateKey': const Uint8ListConverter().toJson(instance.privateKey),
};
