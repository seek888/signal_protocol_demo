// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signal_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SignalMessage _$SignalMessageFromJson(Map<String, dynamic> json) {
  return _SignalMessage.fromJson(json);
}

/// @nodoc
mixin _$SignalMessage {
  @Uint8ListConverter()
  Uint8List get ratchetKey => throw _privateConstructorUsedError;
  int get counter => throw _privateConstructorUsedError;
  int get previousCounter => throw _privateConstructorUsedError;
  @Uint8ListConverter()
  Uint8List get ciphertext => throw _privateConstructorUsedError;
  @Uint8ListConverter()
  Uint8List get mac => throw _privateConstructorUsedError;

  /// Serializes this SignalMessage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SignalMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SignalMessageCopyWith<SignalMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignalMessageCopyWith<$Res> {
  factory $SignalMessageCopyWith(
    SignalMessage value,
    $Res Function(SignalMessage) then,
  ) = _$SignalMessageCopyWithImpl<$Res, SignalMessage>;
  @useResult
  $Res call({
    @Uint8ListConverter() Uint8List ratchetKey,
    int counter,
    int previousCounter,
    @Uint8ListConverter() Uint8List ciphertext,
    @Uint8ListConverter() Uint8List mac,
  });
}

/// @nodoc
class _$SignalMessageCopyWithImpl<$Res, $Val extends SignalMessage>
    implements $SignalMessageCopyWith<$Res> {
  _$SignalMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignalMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ratchetKey = null,
    Object? counter = null,
    Object? previousCounter = null,
    Object? ciphertext = null,
    Object? mac = null,
  }) {
    return _then(
      _value.copyWith(
            ratchetKey: null == ratchetKey
                ? _value.ratchetKey
                : ratchetKey // ignore: cast_nullable_to_non_nullable
                      as Uint8List,
            counter: null == counter
                ? _value.counter
                : counter // ignore: cast_nullable_to_non_nullable
                      as int,
            previousCounter: null == previousCounter
                ? _value.previousCounter
                : previousCounter // ignore: cast_nullable_to_non_nullable
                      as int,
            ciphertext: null == ciphertext
                ? _value.ciphertext
                : ciphertext // ignore: cast_nullable_to_non_nullable
                      as Uint8List,
            mac: null == mac
                ? _value.mac
                : mac // ignore: cast_nullable_to_non_nullable
                      as Uint8List,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SignalMessageImplCopyWith<$Res>
    implements $SignalMessageCopyWith<$Res> {
  factory _$$SignalMessageImplCopyWith(
    _$SignalMessageImpl value,
    $Res Function(_$SignalMessageImpl) then,
  ) = __$$SignalMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @Uint8ListConverter() Uint8List ratchetKey,
    int counter,
    int previousCounter,
    @Uint8ListConverter() Uint8List ciphertext,
    @Uint8ListConverter() Uint8List mac,
  });
}

/// @nodoc
class __$$SignalMessageImplCopyWithImpl<$Res>
    extends _$SignalMessageCopyWithImpl<$Res, _$SignalMessageImpl>
    implements _$$SignalMessageImplCopyWith<$Res> {
  __$$SignalMessageImplCopyWithImpl(
    _$SignalMessageImpl _value,
    $Res Function(_$SignalMessageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SignalMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ratchetKey = null,
    Object? counter = null,
    Object? previousCounter = null,
    Object? ciphertext = null,
    Object? mac = null,
  }) {
    return _then(
      _$SignalMessageImpl(
        ratchetKey: null == ratchetKey
            ? _value.ratchetKey
            : ratchetKey // ignore: cast_nullable_to_non_nullable
                  as Uint8List,
        counter: null == counter
            ? _value.counter
            : counter // ignore: cast_nullable_to_non_nullable
                  as int,
        previousCounter: null == previousCounter
            ? _value.previousCounter
            : previousCounter // ignore: cast_nullable_to_non_nullable
                  as int,
        ciphertext: null == ciphertext
            ? _value.ciphertext
            : ciphertext // ignore: cast_nullable_to_non_nullable
                  as Uint8List,
        mac: null == mac
            ? _value.mac
            : mac // ignore: cast_nullable_to_non_nullable
                  as Uint8List,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SignalMessageImpl implements _SignalMessage {
  const _$SignalMessageImpl({
    @Uint8ListConverter() required this.ratchetKey,
    required this.counter,
    required this.previousCounter,
    @Uint8ListConverter() required this.ciphertext,
    @Uint8ListConverter() required this.mac,
  });

  factory _$SignalMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignalMessageImplFromJson(json);

  @override
  @Uint8ListConverter()
  final Uint8List ratchetKey;
  @override
  final int counter;
  @override
  final int previousCounter;
  @override
  @Uint8ListConverter()
  final Uint8List ciphertext;
  @override
  @Uint8ListConverter()
  final Uint8List mac;

  @override
  String toString() {
    return 'SignalMessage(ratchetKey: $ratchetKey, counter: $counter, previousCounter: $previousCounter, ciphertext: $ciphertext, mac: $mac)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignalMessageImpl &&
            const DeepCollectionEquality().equals(
              other.ratchetKey,
              ratchetKey,
            ) &&
            (identical(other.counter, counter) || other.counter == counter) &&
            (identical(other.previousCounter, previousCounter) ||
                other.previousCounter == previousCounter) &&
            const DeepCollectionEquality().equals(
              other.ciphertext,
              ciphertext,
            ) &&
            const DeepCollectionEquality().equals(other.mac, mac));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(ratchetKey),
    counter,
    previousCounter,
    const DeepCollectionEquality().hash(ciphertext),
    const DeepCollectionEquality().hash(mac),
  );

  /// Create a copy of SignalMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignalMessageImplCopyWith<_$SignalMessageImpl> get copyWith =>
      __$$SignalMessageImplCopyWithImpl<_$SignalMessageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignalMessageImplToJson(this);
  }
}

abstract class _SignalMessage implements SignalMessage {
  const factory _SignalMessage({
    @Uint8ListConverter() required final Uint8List ratchetKey,
    required final int counter,
    required final int previousCounter,
    @Uint8ListConverter() required final Uint8List ciphertext,
    @Uint8ListConverter() required final Uint8List mac,
  }) = _$SignalMessageImpl;

  factory _SignalMessage.fromJson(Map<String, dynamic> json) =
      _$SignalMessageImpl.fromJson;

  @override
  @Uint8ListConverter()
  Uint8List get ratchetKey;
  @override
  int get counter;
  @override
  int get previousCounter;
  @override
  @Uint8ListConverter()
  Uint8List get ciphertext;
  @override
  @Uint8ListConverter()
  Uint8List get mac;

  /// Create a copy of SignalMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignalMessageImplCopyWith<_$SignalMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
