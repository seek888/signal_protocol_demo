import 'dart:typed_data';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../util/uint8list_converter.dart';

part 'signal_message.freezed.dart';
part 'signal_message.g.dart';

/// A regular Signal Protocol message (post-X3DH).
@freezed
class SignalMessage with _$SignalMessage {
  const factory SignalMessage({
    @Uint8ListConverter() required Uint8List ratchetKey,
    required int counter,
    required int previousCounter,
    @Uint8ListConverter() required Uint8List ciphertext,
    @Uint8ListConverter() required Uint8List mac,
  }) = _SignalMessage;

  factory SignalMessage.fromJson(Map<String, dynamic> json) =>
      _$SignalMessageFromJson(json);
}
