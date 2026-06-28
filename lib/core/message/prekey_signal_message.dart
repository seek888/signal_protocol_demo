import 'dart:typed_data';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../util/uint8list_converter.dart';
import '../message/signal_message.dart';

part 'prekey_signal_message.freezed.dart';
part 'prekey_signal_message.g.dart';

/// The first message in a Signal session, carrying X3DH enrolment data
/// plus an embedded [SignalMessage].
@freezed
class PreKeySignalMessage with _$PreKeySignalMessage {
  const factory PreKeySignalMessage({
    required int registrationId,
    int? preKeyId,
    required int signedPreKeyId,
    @Uint8ListConverter() required Uint8List baseKey,
    @Uint8ListConverter() required Uint8List identityKey,
    required SignalMessage message,
  }) = _PreKeySignalMessage;

  factory PreKeySignalMessage.fromJson(Map<String, dynamic> json) =>
      _$PreKeySignalMessageFromJson(json);
}
