// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SessionStateImpl _$$SessionStateImplFromJson(Map<String, dynamic> json) =>
    _$SessionStateImpl(
      ratchetState: RatchetState.fromJson(
        json['ratchetState'] as Map<String, dynamic>,
      ),
      remoteIdentityKey: const Uint8ListConverter().fromJson(
        json['remoteIdentityKey'] as String,
      ),
      localIdentityKey: const Uint8ListConverter().fromJson(
        json['localIdentityKey'] as String,
      ),
      pendingPreKeyId: (json['pendingPreKeyId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SessionStateImplToJson(_$SessionStateImpl instance) =>
    <String, dynamic>{
      'ratchetState': instance.ratchetState,
      'remoteIdentityKey': const Uint8ListConverter().toJson(
        instance.remoteIdentityKey,
      ),
      'localIdentityKey': const Uint8ListConverter().toJson(
        instance.localIdentityKey,
      ),
      'pendingPreKeyId': instance.pendingPreKeyId,
    };
