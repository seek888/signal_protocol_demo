// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signal_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SignalMessageImpl _$$SignalMessageImplFromJson(
  Map<String, dynamic> json,
) => _$SignalMessageImpl(
  ratchetKey: const Uint8ListConverter().fromJson(json['ratchetKey'] as String),
  counter: (json['counter'] as num).toInt(),
  previousCounter: (json['previousCounter'] as num).toInt(),
  ciphertext: const Uint8ListConverter().fromJson(json['ciphertext'] as String),
  mac: const Uint8ListConverter().fromJson(json['mac'] as String),
);

Map<String, dynamic> _$$SignalMessageImplToJson(_$SignalMessageImpl instance) =>
    <String, dynamic>{
      'ratchetKey': const Uint8ListConverter().toJson(instance.ratchetKey),
      'counter': instance.counter,
      'previousCounter': instance.previousCounter,
      'ciphertext': const Uint8ListConverter().toJson(instance.ciphertext),
      'mac': const Uint8ListConverter().toJson(instance.mac),
    };
