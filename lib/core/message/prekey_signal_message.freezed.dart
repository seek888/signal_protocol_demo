// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prekey_signal_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PreKeySignalMessage _$PreKeySignalMessageFromJson(Map<String, dynamic> json) {
  return _PreKeySignalMessage.fromJson(json);
}

/// @nodoc
mixin _$PreKeySignalMessage {
  int get registrationId => throw _privateConstructorUsedError;
  int? get preKeyId => throw _privateConstructorUsedError;
  int get signedPreKeyId => throw _privateConstructorUsedError;
  @Uint8ListConverter()
  Uint8List get baseKey => throw _privateConstructorUsedError;
  @Uint8ListConverter()
  Uint8List get identityKey => throw _privateConstructorUsedError;
  SignalMessage get message => throw _privateConstructorUsedError;

  /// Serializes this PreKeySignalMessage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PreKeySignalMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PreKeySignalMessageCopyWith<PreKeySignalMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreKeySignalMessageCopyWith<$Res> {
  factory $PreKeySignalMessageCopyWith(
    PreKeySignalMessage value,
    $Res Function(PreKeySignalMessage) then,
  ) = _$PreKeySignalMessageCopyWithImpl<$Res, PreKeySignalMessage>;
  @useResult
  $Res call({
    int registrationId,
    int? preKeyId,
    int signedPreKeyId,
    @Uint8ListConverter() Uint8List baseKey,
    @Uint8ListConverter() Uint8List identityKey,
    SignalMessage message,
  });

  $SignalMessageCopyWith<$Res> get message;
}

/// @nodoc
class _$PreKeySignalMessageCopyWithImpl<$Res, $Val extends PreKeySignalMessage>
    implements $PreKeySignalMessageCopyWith<$Res> {
  _$PreKeySignalMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PreKeySignalMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? registrationId = null,
    Object? preKeyId = freezed,
    Object? signedPreKeyId = null,
    Object? baseKey = null,
    Object? identityKey = null,
    Object? message = null,
  }) {
    return _then(
      _value.copyWith(
            registrationId: null == registrationId
                ? _value.registrationId
                : registrationId // ignore: cast_nullable_to_non_nullable
                      as int,
            preKeyId: freezed == preKeyId
                ? _value.preKeyId
                : preKeyId // ignore: cast_nullable_to_non_nullable
                      as int?,
            signedPreKeyId: null == signedPreKeyId
                ? _value.signedPreKeyId
                : signedPreKeyId // ignore: cast_nullable_to_non_nullable
                      as int,
            baseKey: null == baseKey
                ? _value.baseKey
                : baseKey // ignore: cast_nullable_to_non_nullable
                      as Uint8List,
            identityKey: null == identityKey
                ? _value.identityKey
                : identityKey // ignore: cast_nullable_to_non_nullable
                      as Uint8List,
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as SignalMessage,
          )
          as $Val,
    );
  }

  /// Create a copy of PreKeySignalMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SignalMessageCopyWith<$Res> get message {
    return $SignalMessageCopyWith<$Res>(_value.message, (value) {
      return _then(_value.copyWith(message: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PreKeySignalMessageImplCopyWith<$Res>
    implements $PreKeySignalMessageCopyWith<$Res> {
  factory _$$PreKeySignalMessageImplCopyWith(
    _$PreKeySignalMessageImpl value,
    $Res Function(_$PreKeySignalMessageImpl) then,
  ) = __$$PreKeySignalMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int registrationId,
    int? preKeyId,
    int signedPreKeyId,
    @Uint8ListConverter() Uint8List baseKey,
    @Uint8ListConverter() Uint8List identityKey,
    SignalMessage message,
  });

  @override
  $SignalMessageCopyWith<$Res> get message;
}

/// @nodoc
class __$$PreKeySignalMessageImplCopyWithImpl<$Res>
    extends _$PreKeySignalMessageCopyWithImpl<$Res, _$PreKeySignalMessageImpl>
    implements _$$PreKeySignalMessageImplCopyWith<$Res> {
  __$$PreKeySignalMessageImplCopyWithImpl(
    _$PreKeySignalMessageImpl _value,
    $Res Function(_$PreKeySignalMessageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PreKeySignalMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? registrationId = null,
    Object? preKeyId = freezed,
    Object? signedPreKeyId = null,
    Object? baseKey = null,
    Object? identityKey = null,
    Object? message = null,
  }) {
    return _then(
      _$PreKeySignalMessageImpl(
        registrationId: null == registrationId
            ? _value.registrationId
            : registrationId // ignore: cast_nullable_to_non_nullable
                  as int,
        preKeyId: freezed == preKeyId
            ? _value.preKeyId
            : preKeyId // ignore: cast_nullable_to_non_nullable
                  as int?,
        signedPreKeyId: null == signedPreKeyId
            ? _value.signedPreKeyId
            : signedPreKeyId // ignore: cast_nullable_to_non_nullable
                  as int,
        baseKey: null == baseKey
            ? _value.baseKey
            : baseKey // ignore: cast_nullable_to_non_nullable
                  as Uint8List,
        identityKey: null == identityKey
            ? _value.identityKey
            : identityKey // ignore: cast_nullable_to_non_nullable
                  as Uint8List,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as SignalMessage,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PreKeySignalMessageImpl implements _PreKeySignalMessage {
  const _$PreKeySignalMessageImpl({
    required this.registrationId,
    this.preKeyId,
    required this.signedPreKeyId,
    @Uint8ListConverter() required this.baseKey,
    @Uint8ListConverter() required this.identityKey,
    required this.message,
  });

  factory _$PreKeySignalMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$PreKeySignalMessageImplFromJson(json);

  @override
  final int registrationId;
  @override
  final int? preKeyId;
  @override
  final int signedPreKeyId;
  @override
  @Uint8ListConverter()
  final Uint8List baseKey;
  @override
  @Uint8ListConverter()
  final Uint8List identityKey;
  @override
  final SignalMessage message;

  @override
  String toString() {
    return 'PreKeySignalMessage(registrationId: $registrationId, preKeyId: $preKeyId, signedPreKeyId: $signedPreKeyId, baseKey: $baseKey, identityKey: $identityKey, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PreKeySignalMessageImpl &&
            (identical(other.registrationId, registrationId) ||
                other.registrationId == registrationId) &&
            (identical(other.preKeyId, preKeyId) ||
                other.preKeyId == preKeyId) &&
            (identical(other.signedPreKeyId, signedPreKeyId) ||
                other.signedPreKeyId == signedPreKeyId) &&
            const DeepCollectionEquality().equals(other.baseKey, baseKey) &&
            const DeepCollectionEquality().equals(
              other.identityKey,
              identityKey,
            ) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    registrationId,
    preKeyId,
    signedPreKeyId,
    const DeepCollectionEquality().hash(baseKey),
    const DeepCollectionEquality().hash(identityKey),
    message,
  );

  /// Create a copy of PreKeySignalMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PreKeySignalMessageImplCopyWith<_$PreKeySignalMessageImpl> get copyWith =>
      __$$PreKeySignalMessageImplCopyWithImpl<_$PreKeySignalMessageImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PreKeySignalMessageImplToJson(this);
  }
}

abstract class _PreKeySignalMessage implements PreKeySignalMessage {
  const factory _PreKeySignalMessage({
    required final int registrationId,
    final int? preKeyId,
    required final int signedPreKeyId,
    @Uint8ListConverter() required final Uint8List baseKey,
    @Uint8ListConverter() required final Uint8List identityKey,
    required final SignalMessage message,
  }) = _$PreKeySignalMessageImpl;

  factory _PreKeySignalMessage.fromJson(Map<String, dynamic> json) =
      _$PreKeySignalMessageImpl.fromJson;

  @override
  int get registrationId;
  @override
  int? get preKeyId;
  @override
  int get signedPreKeyId;
  @override
  @Uint8ListConverter()
  Uint8List get baseKey;
  @override
  @Uint8ListConverter()
  Uint8List get identityKey;
  @override
  SignalMessage get message;

  /// Create a copy of PreKeySignalMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PreKeySignalMessageImplCopyWith<_$PreKeySignalMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
