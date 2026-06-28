// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prekey_bundle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PreKeyBundleImpl _$$PreKeyBundleImplFromJson(Map<String, dynamic> json) =>
    _$PreKeyBundleImpl(
      registrationId: (json['registrationId'] as num).toInt(),
      deviceId: (json['deviceId'] as num).toInt(),
      signedPreKeyId: (json['signedPreKeyId'] as num).toInt(),
      signedPreKey: const Uint8ListConverter().fromJson(
        json['signedPreKey'] as String,
      ),
      signedPreKeySignature: const Uint8ListConverter().fromJson(
        json['signedPreKeySignature'] as String,
      ),
      oneTimePreKey: const NullableUint8ListConverter().fromJson(
        json['oneTimePreKey'] as String?,
      ),
      oneTimePreKeyId: (json['oneTimePreKeyId'] as num?)?.toInt(),
      identityKey: const Uint8ListConverter().fromJson(
        json['identityKey'] as String,
      ),
    );

Map<String, dynamic> _$$PreKeyBundleImplToJson(_$PreKeyBundleImpl instance) =>
    <String, dynamic>{
      'registrationId': instance.registrationId,
      'deviceId': instance.deviceId,
      'signedPreKeyId': instance.signedPreKeyId,
      'signedPreKey': const Uint8ListConverter().toJson(instance.signedPreKey),
      'signedPreKeySignature': const Uint8ListConverter().toJson(
        instance.signedPreKeySignature,
      ),
      'oneTimePreKey': const NullableUint8ListConverter().toJson(
        instance.oneTimePreKey,
      ),
      'oneTimePreKeyId': instance.oneTimePreKeyId,
      'identityKey': const Uint8ListConverter().toJson(instance.identityKey),
    };
