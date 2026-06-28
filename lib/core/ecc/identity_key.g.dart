// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'identity_key.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IdentityKeyImpl _$$IdentityKeyImplFromJson(Map<String, dynamic> json) =>
    _$IdentityKeyImpl(
      publicKey: const Uint8ListConverter().fromJson(
        json['publicKey'] as String,
      ),
    );

Map<String, dynamic> _$$IdentityKeyImplToJson(_$IdentityKeyImpl instance) =>
    <String, dynamic>{
      'publicKey': const Uint8ListConverter().toJson(instance.publicKey),
    };
