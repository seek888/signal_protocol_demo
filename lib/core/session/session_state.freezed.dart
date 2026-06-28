// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SessionState _$SessionStateFromJson(Map<String, dynamic> json) {
  return _SessionState.fromJson(json);
}

/// @nodoc
mixin _$SessionState {
  RatchetState get ratchetState => throw _privateConstructorUsedError;
  @Uint8ListConverter()
  Uint8List get remoteIdentityKey => throw _privateConstructorUsedError;
  @Uint8ListConverter()
  Uint8List get localIdentityKey => throw _privateConstructorUsedError;
  int? get pendingPreKeyId => throw _privateConstructorUsedError;

  /// Serializes this SessionState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SessionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SessionStateCopyWith<SessionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionStateCopyWith<$Res> {
  factory $SessionStateCopyWith(
    SessionState value,
    $Res Function(SessionState) then,
  ) = _$SessionStateCopyWithImpl<$Res, SessionState>;
  @useResult
  $Res call({
    RatchetState ratchetState,
    @Uint8ListConverter() Uint8List remoteIdentityKey,
    @Uint8ListConverter() Uint8List localIdentityKey,
    int? pendingPreKeyId,
  });

  $RatchetStateCopyWith<$Res> get ratchetState;
}

/// @nodoc
class _$SessionStateCopyWithImpl<$Res, $Val extends SessionState>
    implements $SessionStateCopyWith<$Res> {
  _$SessionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SessionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ratchetState = null,
    Object? remoteIdentityKey = null,
    Object? localIdentityKey = null,
    Object? pendingPreKeyId = freezed,
  }) {
    return _then(
      _value.copyWith(
            ratchetState: null == ratchetState
                ? _value.ratchetState
                : ratchetState // ignore: cast_nullable_to_non_nullable
                      as RatchetState,
            remoteIdentityKey: null == remoteIdentityKey
                ? _value.remoteIdentityKey
                : remoteIdentityKey // ignore: cast_nullable_to_non_nullable
                      as Uint8List,
            localIdentityKey: null == localIdentityKey
                ? _value.localIdentityKey
                : localIdentityKey // ignore: cast_nullable_to_non_nullable
                      as Uint8List,
            pendingPreKeyId: freezed == pendingPreKeyId
                ? _value.pendingPreKeyId
                : pendingPreKeyId // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }

  /// Create a copy of SessionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RatchetStateCopyWith<$Res> get ratchetState {
    return $RatchetStateCopyWith<$Res>(_value.ratchetState, (value) {
      return _then(_value.copyWith(ratchetState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SessionStateImplCopyWith<$Res>
    implements $SessionStateCopyWith<$Res> {
  factory _$$SessionStateImplCopyWith(
    _$SessionStateImpl value,
    $Res Function(_$SessionStateImpl) then,
  ) = __$$SessionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    RatchetState ratchetState,
    @Uint8ListConverter() Uint8List remoteIdentityKey,
    @Uint8ListConverter() Uint8List localIdentityKey,
    int? pendingPreKeyId,
  });

  @override
  $RatchetStateCopyWith<$Res> get ratchetState;
}

/// @nodoc
class __$$SessionStateImplCopyWithImpl<$Res>
    extends _$SessionStateCopyWithImpl<$Res, _$SessionStateImpl>
    implements _$$SessionStateImplCopyWith<$Res> {
  __$$SessionStateImplCopyWithImpl(
    _$SessionStateImpl _value,
    $Res Function(_$SessionStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SessionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ratchetState = null,
    Object? remoteIdentityKey = null,
    Object? localIdentityKey = null,
    Object? pendingPreKeyId = freezed,
  }) {
    return _then(
      _$SessionStateImpl(
        ratchetState: null == ratchetState
            ? _value.ratchetState
            : ratchetState // ignore: cast_nullable_to_non_nullable
                  as RatchetState,
        remoteIdentityKey: null == remoteIdentityKey
            ? _value.remoteIdentityKey
            : remoteIdentityKey // ignore: cast_nullable_to_non_nullable
                  as Uint8List,
        localIdentityKey: null == localIdentityKey
            ? _value.localIdentityKey
            : localIdentityKey // ignore: cast_nullable_to_non_nullable
                  as Uint8List,
        pendingPreKeyId: freezed == pendingPreKeyId
            ? _value.pendingPreKeyId
            : pendingPreKeyId // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SessionStateImpl implements _SessionState {
  const _$SessionStateImpl({
    required this.ratchetState,
    @Uint8ListConverter() required this.remoteIdentityKey,
    @Uint8ListConverter() required this.localIdentityKey,
    this.pendingPreKeyId,
  });

  factory _$SessionStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$SessionStateImplFromJson(json);

  @override
  final RatchetState ratchetState;
  @override
  @Uint8ListConverter()
  final Uint8List remoteIdentityKey;
  @override
  @Uint8ListConverter()
  final Uint8List localIdentityKey;
  @override
  final int? pendingPreKeyId;

  @override
  String toString() {
    return 'SessionState(ratchetState: $ratchetState, remoteIdentityKey: $remoteIdentityKey, localIdentityKey: $localIdentityKey, pendingPreKeyId: $pendingPreKeyId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionStateImpl &&
            (identical(other.ratchetState, ratchetState) ||
                other.ratchetState == ratchetState) &&
            const DeepCollectionEquality().equals(
              other.remoteIdentityKey,
              remoteIdentityKey,
            ) &&
            const DeepCollectionEquality().equals(
              other.localIdentityKey,
              localIdentityKey,
            ) &&
            (identical(other.pendingPreKeyId, pendingPreKeyId) ||
                other.pendingPreKeyId == pendingPreKeyId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    ratchetState,
    const DeepCollectionEquality().hash(remoteIdentityKey),
    const DeepCollectionEquality().hash(localIdentityKey),
    pendingPreKeyId,
  );

  /// Create a copy of SessionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionStateImplCopyWith<_$SessionStateImpl> get copyWith =>
      __$$SessionStateImplCopyWithImpl<_$SessionStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SessionStateImplToJson(this);
  }
}

abstract class _SessionState implements SessionState {
  const factory _SessionState({
    required final RatchetState ratchetState,
    @Uint8ListConverter() required final Uint8List remoteIdentityKey,
    @Uint8ListConverter() required final Uint8List localIdentityKey,
    final int? pendingPreKeyId,
  }) = _$SessionStateImpl;

  factory _SessionState.fromJson(Map<String, dynamic> json) =
      _$SessionStateImpl.fromJson;

  @override
  RatchetState get ratchetState;
  @override
  @Uint8ListConverter()
  Uint8List get remoteIdentityKey;
  @override
  @Uint8ListConverter()
  Uint8List get localIdentityKey;
  @override
  int? get pendingPreKeyId;

  /// Create a copy of SessionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SessionStateImplCopyWith<_$SessionStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
