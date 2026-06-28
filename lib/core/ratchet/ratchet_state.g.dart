// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ratchet_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReceiverChainImpl _$$ReceiverChainImplFromJson(Map<String, dynamic> json) =>
    _$ReceiverChainImpl(
      ratchetKey: const Uint8ListConverter().fromJson(
        json['ratchetKey'] as String,
      ),
      chainKey: ChainKey.fromJson(json['chainKey'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ReceiverChainImplToJson(_$ReceiverChainImpl instance) =>
    <String, dynamic>{
      'ratchetKey': const Uint8ListConverter().toJson(instance.ratchetKey),
      'chainKey': instance.chainKey,
    };

_$SkippedMessageKeyImpl _$$SkippedMessageKeyImplFromJson(
  Map<String, dynamic> json,
) => _$SkippedMessageKeyImpl(
  ratchetKey: const Uint8ListConverter().fromJson(json['ratchetKey'] as String),
  counter: (json['counter'] as num).toInt(),
  messageKeys: MessageKeys.fromJson(
    json['messageKeys'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$$SkippedMessageKeyImplToJson(
  _$SkippedMessageKeyImpl instance,
) => <String, dynamic>{
  'ratchetKey': const Uint8ListConverter().toJson(instance.ratchetKey),
  'counter': instance.counter,
  'messageKeys': instance.messageKeys,
};

_$RatchetStateImpl _$$RatchetStateImplFromJson(Map<String, dynamic> json) =>
    _$RatchetStateImpl(
      rootKey: RootKey.fromJson(json['rootKey'] as Map<String, dynamic>),
      senderRatchetKeyPair: ECKeyPair.fromJson(
        json['senderRatchetKeyPair'] as Map<String, dynamic>,
      ),
      senderChainKey: ChainKey.fromJson(
        json['senderChainKey'] as Map<String, dynamic>,
      ),
      receiverChains:
          (json['receiverChains'] as List<dynamic>?)
              ?.map((e) => ReceiverChain.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      skippedMessageKeys:
          (json['skippedMessageKeys'] as List<dynamic>?)
              ?.map(
                (e) => SkippedMessageKey.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
      previousCounter: (json['previousCounter'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$RatchetStateImplToJson(_$RatchetStateImpl instance) =>
    <String, dynamic>{
      'rootKey': instance.rootKey,
      'senderRatchetKeyPair': instance.senderRatchetKeyPair,
      'senderChainKey': instance.senderChainKey,
      'receiverChains': instance.receiverChains,
      'skippedMessageKeys': instance.skippedMessageKeys,
      'previousCounter': instance.previousCounter,
    };
