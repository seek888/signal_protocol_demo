import 'dart:typed_data';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../util/uint8list_converter.dart';
import '../ratchet/ratchet_state.dart';

part 'session_state.freezed.dart';
part 'session_state.g.dart';

/// Complete session context — includes the ratchet state + identity info.
@freezed
class SessionState with _$SessionState {
  const factory SessionState({
    required RatchetState ratchetState,
    @Uint8ListConverter() required Uint8List remoteIdentityKey,
    @Uint8ListConverter() required Uint8List localIdentityKey,
    int? pendingPreKeyId,
  }) = _SessionState;

  factory SessionState.fromJson(Map<String, dynamic> json) =>
      _$SessionStateFromJson(json);
}
