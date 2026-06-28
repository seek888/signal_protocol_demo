// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chain_key.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ChainKey _$ChainKeyFromJson(Map<String, dynamic> json) {
  return _ChainKey.fromJson(json);
}

/// @nodoc
mixin _$ChainKey {
  @Uint8ListConverter()
  Uint8List get key => throw _privateConstructorUsedError; // 32 bytes
  int get index => throw _privateConstructorUsedError;

  /// Serializes this ChainKey to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChainKey
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChainKeyCopyWith<ChainKey> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChainKeyCopyWith<$Res> {
  factory $ChainKeyCopyWith(ChainKey value, $Res Function(ChainKey) then) =
      _$ChainKeyCopyWithImpl<$Res, ChainKey>;
  @useResult
  $Res call({@Uint8ListConverter() Uint8List key, int index});
}

/// @nodoc
class _$ChainKeyCopyWithImpl<$Res, $Val extends ChainKey>
    implements $ChainKeyCopyWith<$Res> {
  _$ChainKeyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChainKey
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? key = null, Object? index = null}) {
    return _then(
      _value.copyWith(
            key: null == key
                ? _value.key
                : key // ignore: cast_nullable_to_non_nullable
                      as Uint8List,
            index: null == index
                ? _value.index
                : index // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ChainKeyImplCopyWith<$Res>
    implements $ChainKeyCopyWith<$Res> {
  factory _$$ChainKeyImplCopyWith(
    _$ChainKeyImpl value,
    $Res Function(_$ChainKeyImpl) then,
  ) = __$$ChainKeyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@Uint8ListConverter() Uint8List key, int index});
}

/// @nodoc
class __$$ChainKeyImplCopyWithImpl<$Res>
    extends _$ChainKeyCopyWithImpl<$Res, _$ChainKeyImpl>
    implements _$$ChainKeyImplCopyWith<$Res> {
  __$$ChainKeyImplCopyWithImpl(
    _$ChainKeyImpl _value,
    $Res Function(_$ChainKeyImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChainKey
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? key = null, Object? index = null}) {
    return _then(
      _$ChainKeyImpl(
        key: null == key
            ? _value.key
            : key // ignore: cast_nullable_to_non_nullable
                  as Uint8List,
        index: null == index
            ? _value.index
            : index // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ChainKeyImpl extends _ChainKey {
  const _$ChainKeyImpl({
    @Uint8ListConverter() required this.key,
    required this.index,
  }) : super._();

  factory _$ChainKeyImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChainKeyImplFromJson(json);

  @override
  @Uint8ListConverter()
  final Uint8List key;
  // 32 bytes
  @override
  final int index;

  @override
  String toString() {
    return 'ChainKey(key: $key, index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChainKeyImpl &&
            const DeepCollectionEquality().equals(other.key, key) &&
            (identical(other.index, index) || other.index == index));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(key), index);

  /// Create a copy of ChainKey
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChainKeyImplCopyWith<_$ChainKeyImpl> get copyWith =>
      __$$ChainKeyImplCopyWithImpl<_$ChainKeyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChainKeyImplToJson(this);
  }
}

abstract class _ChainKey extends ChainKey {
  const factory _ChainKey({
    @Uint8ListConverter() required final Uint8List key,
    required final int index,
  }) = _$ChainKeyImpl;
  const _ChainKey._() : super._();

  factory _ChainKey.fromJson(Map<String, dynamic> json) =
      _$ChainKeyImpl.fromJson;

  @override
  @Uint8ListConverter()
  Uint8List get key; // 32 bytes
  @override
  int get index;

  /// Create a copy of ChainKey
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChainKeyImplCopyWith<_$ChainKeyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
