// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prekey_signal_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PreKeySignalMessageImpl _$$PreKeySignalMessageImplFromJson(
  Map<String, dynamic> json,
) => _$PreKeySignalMessageImpl(
  registrationId: (json['registrationId'] as num).toInt(),
  preKeyId: (json['preKeyId'] as num?)?.toInt(),
  signedPreKeyId: (json['signedPreKeyId'] as num).toInt(),
  baseKey: const Uint8ListConverter().fromJson(json['baseKey'] as String),
  identityKey: const Uint8ListConverter().fromJson(
    json['identityKey'] as String,
  ),
  message: SignalMessage.fromJson(json['message'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$PreKeySignalMessageImplToJson(
  _$PreKeySignalMessageImpl instance,
) => <String, dynamic>{
  'registrationId': instance.registrationId,
  'preKeyId': instance.preKeyId,
  'signedPreKeyId': instance.signedPreKeyId,
  'baseKey': const Uint8ListConverter().toJson(instance.baseKey),
  'identityKey': const Uint8ListConverter().toJson(instance.identityKey),
  'message': instance.message,
};
