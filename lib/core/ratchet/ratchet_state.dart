import 'dart:typed_data';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../util/uint8list_converter.dart';
import '../ecc/ec_key_pair.dart';
import '../ratchet/root_key.dart';
import '../ratchet/chain_key.dart';
import '../ratchet/message_keys.dart';

part 'ratchet_state.freezed.dart';
part 'ratchet_state.g.dart';

/// A single receiver chain entry.
@freezed
class ReceiverChain with _$ReceiverChain {
  const factory ReceiverChain({
    @Uint8ListConverter() required Uint8List ratchetKey,
    required ChainKey chainKey,
  }) = _ReceiverChain;

  factory ReceiverChain.fromJson(Map<String, dynamic> json) =>
      _$ReceiverChainFromJson(json);
}

/// A skipped message key entry.
@freezed
class SkippedMessageKey with _$SkippedMessageKey {
  const factory SkippedMessageKey({
    @Uint8ListConverter() required Uint8List ratchetKey,
    required int counter,
    required MessageKeys messageKeys,
  }) = _SkippedMessageKey;

  factory SkippedMessageKey.fromJson(Map<String, dynamic> json) =>
      _$SkippedMessageKeyFromJson(json);
}

/// Full Double Ratchet session state.
@freezed
class RatchetState with _$RatchetState {
  const factory RatchetState({
    required RootKey rootKey,
    required ECKeyPair senderRatchetKeyPair,
    required ChainKey senderChainKey,
    @Default([]) List<ReceiverChain> receiverChains,
    @Default([]) List<SkippedMessageKey> skippedMessageKeys,
    @Default(0) int previousCounter,
  }) = _RatchetState;

  factory RatchetState.fromJson(Map<String, dynamic> json) =>
      _$RatchetStateFromJson(json);
}
