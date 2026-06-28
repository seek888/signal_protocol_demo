// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_keys.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageKeysImpl _$$MessageKeysImplFromJson(Map<String, dynamic> json) =>
    _$MessageKeysImpl(
      cipherKey: const Uint8ListConverter().fromJson(
        json['cipherKey'] as String,
      ),
      macKey: const Uint8ListConverter().fromJson(json['macKey'] as String),
      iv: const Uint8ListConverter().fromJson(json['iv'] as String),
      counter: (json['counter'] as num).toInt(),
    );

Map<String, dynamic> _$$MessageKeysImplToJson(_$MessageKeysImpl instance) =>
    <String, dynamic>{
      'cipherKey': const Uint8ListConverter().toJson(instance.cipherKey),
      'macKey': const Uint8ListConverter().toJson(instance.macKey),
      'iv': const Uint8ListConverter().toJson(instance.iv),
      'counter': instance.counter,
    };
