import 'dart:typed_data';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../util/uint8list_converter.dart';

part 'message_keys.freezed.dart';
part 'message_keys.g.dart';

/// Message keys derived from a chain key.
///
/// In the Signal spec these are produced by HKDF from a single HMAC output.
@freezed
class MessageKeys with _$MessageKeys {
  const factory MessageKeys({
    @Uint8ListConverter() required Uint8List cipherKey, // 32 bytes
    @Uint8ListConverter() required Uint8List macKey,    // 32 bytes
    @Uint8ListConverter() required Uint8List iv,        // 16 bytes (CBC) or 12 bytes (GCM)
    required int counter,
  }) = _MessageKeys;

  factory MessageKeys.fromJson(Map<String, dynamic> json) =>
      _$MessageKeysFromJson(json);
}
