import 'dart:typed_data';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../util/uint8list_converter.dart';

part 'prekey_bundle.freezed.dart';
part 'prekey_bundle.g.dart';

/// A PreKey bundle published by Bob for X3DH initiation.
@freezed
class PreKeyBundle with _$PreKeyBundle {
  const factory PreKeyBundle({
    required int registrationId,
    required int deviceId,
    required int signedPreKeyId,
    @Uint8ListConverter() required Uint8List signedPreKey,
    @Uint8ListConverter() required Uint8List signedPreKeySignature,
    @NullableUint8ListConverter() Uint8List? oneTimePreKey,
    int? oneTimePreKeyId,
    @Uint8ListConverter() required Uint8List identityKey,
  }) = _PreKeyBundle;

  factory PreKeyBundle.fromJson(Map<String, dynamic> json) =>
      _$PreKeyBundleFromJson(json);
}
