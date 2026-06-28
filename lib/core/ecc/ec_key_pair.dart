import 'dart:typed_data';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../util/uint8list_converter.dart';

part 'ec_key_pair.freezed.dart';
part 'ec_key_pair.g.dart';

/// A Curve25519 key pair (serialised formats).
///
/// [publicKey] is 33 bytes (0x05 prefix + 32-byte raw key).
/// [privateKey] is 32 raw bytes.
@freezed
class ECKeyPair with _$ECKeyPair {
  const factory ECKeyPair({
    @Uint8ListConverter() required Uint8List publicKey,
    @Uint8ListConverter() required Uint8List privateKey,
  }) = _ECKeyPair;

  factory ECKeyPair.fromJson(Map<String, dynamic> json) =>
      _$ECKeyPairFromJson(json);
}
