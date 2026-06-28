// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_keys.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MessageKeys _$MessageKeysFromJson(Map<String, dynamic> json) {
  return _MessageKeys.fromJson(json);
}

/// @nodoc
mixin _$MessageKeys {
  @Uint8ListConverter()
  Uint8List get cipherKey => throw _privateConstructorUsedError; // 32 bytes
  @Uint8ListConverter()
  Uint8List get macKey => throw _privateConstructorUsedError; // 32 bytes
  @Uint8ListConverter()
  Uint8List get iv => throw _privateConstructorUsedError; // 16 bytes (CBC) or 12 bytes (GCM)
  int get counter => throw _privateConstructorUsedError;

  /// Serializes this MessageKeys to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MessageKeys
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MessageKeysCopyWith<MessageKeys> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageKeysCopyWith<$Res> {
  factory $MessageKeysCopyWith(
    MessageKeys value,
    $Res Function(MessageKeys) then,
  ) = _$MessageKeysCopyWithImpl<$Res, MessageKeys>;
  @useResult
  $Res call({
    @Uint8ListConverter() Uint8List cipherKey,
    @Uint8ListConverter() Uint8List macKey,
    @Uint8ListConverter() Uint8List iv,
    int counter,
  });
}

/// @nodoc
class _$MessageKeysCopyWithImpl<$Res, $Val extends MessageKeys>
    implements $MessageKeysCopyWith<$Res> {
  _$MessageKeysCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MessageKeys
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cipherKey = null,
    Object? macKey = null,
    Object? iv = null,
    Object? counter = null,
  }) {
    return _then(
      _value.copyWith(
            cipherKey: null == cipherKey
                ? _value.cipherKey
                : cipherKey // ignore: cast_nullable_to_non_nullable
                      as Uint8List,
            macKey: null == macKey
                ? _value.macKey
                : macKey // ignore: cast_nullable_to_non_nullable
                      as Uint8List,
            iv: null == iv
                ? _value.iv
                : iv // ignore: cast_nullable_to_non_nullable
                      as Uint8List,
            counter: null == counter
                ? _value.counter
                : counter // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MessageKeysImplCopyWith<$Res>
    implements $MessageKeysCopyWith<$Res> {
  factory _$$MessageKeysImplCopyWith(
    _$MessageKeysImpl value,
    $Res Function(_$MessageKeysImpl) then,
  ) = __$$MessageKeysImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @Uint8ListConverter() Uint8List cipherKey,
    @Uint8ListConverter() Uint8List macKey,
    @Uint8ListConverter() Uint8List iv,
    int counter,
  });
}

/// @nodoc
class __$$MessageKeysImplCopyWithImpl<$Res>
    extends _$MessageKeysCopyWithImpl<$Res, _$MessageKeysImpl>
    implements _$$MessageKeysImplCopyWith<$Res> {
  __$$MessageKeysImplCopyWithImpl(
    _$MessageKeysImpl _value,
    $Res Function(_$MessageKeysImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MessageKeys
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cipherKey = null,
    Object? macKey = null,
    Object? iv = null,
    Object? counter = null,
  }) {
    return _then(
      _$MessageKeysImpl(
        cipherKey: null == cipherKey
            ? _value.cipherKey
            : cipherKey // ignore: cast_nullable_to_non_nullable
                  as Uint8List,
        macKey: null == macKey
            ? _value.macKey
            : macKey // ignore: cast_nullable_to_non_nullable
                  as Uint8List,
        iv: null == iv
            ? _value.iv
            : iv // ignore: cast_nullable_to_non_nullable
                  as Uint8List,
        counter: null == counter
            ? _value.counter
            : counter // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageKeysImpl implements _MessageKeys {
  const _$MessageKeysImpl({
    @Uint8ListConverter() required this.cipherKey,
    @Uint8ListConverter() required this.macKey,
    @Uint8ListConverter() required this.iv,
    required this.counter,
  });

  factory _$MessageKeysImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageKeysImplFromJson(json);

  @override
  @Uint8ListConverter()
  final Uint8List cipherKey;
  // 32 bytes
  @override
  @Uint8ListConverter()
  final Uint8List macKey;
  // 32 bytes
  @override
  @Uint8ListConverter()
  final Uint8List iv;
  // 16 bytes (CBC) or 12 bytes (GCM)
  @override
  final int counter;

  @override
  String toString() {
    return 'MessageKeys(cipherKey: $cipherKey, macKey: $macKey, iv: $iv, counter: $counter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageKeysImpl &&
            const DeepCollectionEquality().equals(other.cipherKey, cipherKey) &&
            const DeepCollectionEquality().equals(other.macKey, macKey) &&
            const DeepCollectionEquality().equals(other.iv, iv) &&
            (identical(other.counter, counter) || other.counter == counter));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(cipherKey),
    const DeepCollectionEquality().hash(macKey),
    const DeepCollectionEquality().hash(iv),
    counter,
  );

  /// Create a copy of MessageKeys
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageKeysImplCopyWith<_$MessageKeysImpl> get copyWith =>
      __$$MessageKeysImplCopyWithImpl<_$MessageKeysImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageKeysImplToJson(this);
  }
}

abstract class _MessageKeys implements MessageKeys {
  const factory _MessageKeys({
    @Uint8ListConverter() required final Uint8List cipherKey,
    @Uint8ListConverter() required final Uint8List macKey,
    @Uint8ListConverter() required final Uint8List iv,
    required final int counter,
  }) = _$MessageKeysImpl;

  factory _MessageKeys.fromJson(Map<String, dynamic> json) =
      _$MessageKeysImpl.fromJson;

  @override
  @Uint8ListConverter()
  Uint8List get cipherKey; // 32 bytes
  @override
  @Uint8ListConverter()
  Uint8List get macKey; // 32 bytes
  @override
  @Uint8ListConverter()
  Uint8List get iv; // 16 bytes (CBC) or 12 bytes (GCM)
  @override
  int get counter;

  /// Create a copy of MessageKeys
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MessageKeysImplCopyWith<_$MessageKeysImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
