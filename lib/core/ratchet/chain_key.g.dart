// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chain_key.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChainKeyImpl _$$ChainKeyImplFromJson(Map<String, dynamic> json) =>
    _$ChainKeyImpl(
      key: const Uint8ListConverter().fromJson(json['key'] as String),
      index: (json['index'] as num).toInt(),
    );

Map<String, dynamic> _$$ChainKeyImplToJson(_$ChainKeyImpl instance) =>
    <String, dynamic>{
      'key': const Uint8ListConverter().toJson(instance.key),
      'index': instance.index,
    };
