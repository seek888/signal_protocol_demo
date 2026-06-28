// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ec_key_pair.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ECKeyPairImpl _$$ECKeyPairImplFromJson(
  Map<String, dynamic> json,
) => _$ECKeyPairImpl(
  publicKey: const Uint8ListConverter().fromJson(json['publicKey'] as String),
  privateKey: const Uint8ListConverter().fromJson(json['privateKey'] as String),
);

Map<String, dynamic> _$$ECKeyPairImplToJson(_$ECKeyPairImpl instance) =>
    <String, dynamic>{
      'publicKey': const Uint8ListConverter().toJson(instance.publicKey),
      'privateKey': const Uint8ListConverter().toJson(instance.privateKey),
    };
