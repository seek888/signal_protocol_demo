import 'dart:convert';
import 'dart:typed_data';
import 'package:freezed_annotation/freezed_annotation.dart';

/// JSON converter for [Uint8List] ↔ base64 string.
class Uint8ListConverter implements JsonConverter<Uint8List, String> {
  const Uint8ListConverter();

  @override
  Uint8List fromJson(String json) =>
      Uint8List.fromList(base64.decode(json));

  @override
  String toJson(Uint8List object) => base64.encode(object);
}

/// Nullable variant.
class NullableUint8ListConverter
    implements JsonConverter<Uint8List?, String?> {
  const NullableUint8ListConverter();

  @override
  Uint8List? fromJson(String? json) =>
      json == null ? null : Uint8List.fromList(base64.decode(json));

  @override
  String? toJson(Uint8List? object) =>
      object == null ? null : base64.encode(object);
}
