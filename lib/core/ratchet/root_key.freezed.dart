// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'root_key.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RootKey _$RootKeyFromJson(Map<String, dynamic> json) {
  return _RootKey.fromJson(json);
}

/// @nodoc
mixin _$RootKey {
  @Uint8ListConverter()
  Uint8List get key => throw _privateConstructorUsedError;

  /// Serializes this RootKey to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RootKey
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RootKeyCopyWith<RootKey> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RootKeyCopyWith<$Res> {
  factory $RootKeyCopyWith(RootKey value, $Res Function(RootKey) then) =
      _$RootKeyCopyWithImpl<$Res, RootKey>;
  @useResult
  $Res call({@Uint8ListConverter() Uint8List key});
}

/// @nodoc
class _$RootKeyCopyWithImpl<$Res, $Val extends RootKey>
    implements $RootKeyCopyWith<$Res> {
  _$RootKeyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RootKey
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? key = null}) {
    return _then(
      _value.copyWith(
            key: null == key
                ? _value.key
                : key // ignore: cast_nullable_to_non_nullable
                      as Uint8List,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RootKeyImplCopyWith<$Res> implements $RootKeyCopyWith<$Res> {
  factory _$$RootKeyImplCopyWith(
    _$RootKeyImpl value,
    $Res Function(_$RootKeyImpl) then,
  ) = __$$RootKeyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@Uint8ListConverter() Uint8List key});
}

/// @nodoc
class __$$RootKeyImplCopyWithImpl<$Res>
    extends _$RootKeyCopyWithImpl<$Res, _$RootKeyImpl>
    implements _$$RootKeyImplCopyWith<$Res> {
  __$$RootKeyImplCopyWithImpl(
    _$RootKeyImpl _value,
    $Res Function(_$RootKeyImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RootKey
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? key = null}) {
    return _then(
      _$RootKeyImpl(
        key: null == key
            ? _value.key
            : key // ignore: cast_nullable_to_non_nullable
                  as Uint8List,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RootKeyImpl extends _RootKey {
  const _$RootKeyImpl({@Uint8ListConverter() required this.key}) : super._();

  factory _$RootKeyImpl.fromJson(Map<String, dynamic> json) =>
      _$$RootKeyImplFromJson(json);

  @override
  @Uint8ListConverter()
  final Uint8List key;

  @override
  String toString() {
    return 'RootKey(key: $key)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RootKeyImpl &&
            const DeepCollectionEquality().equals(other.key, key));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(key));

  /// Create a copy of RootKey
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RootKeyImplCopyWith<_$RootKeyImpl> get copyWith =>
      __$$RootKeyImplCopyWithImpl<_$RootKeyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RootKeyImplToJson(this);
  }
}

abstract class _RootKey extends RootKey {
  const factory _RootKey({@Uint8ListConverter() required final Uint8List key}) =
      _$RootKeyImpl;
  const _RootKey._() : super._();

  factory _RootKey.fromJson(Map<String, dynamic> json) = _$RootKeyImpl.fromJson;

  @override
  @Uint8ListConverter()
  Uint8List get key;

  /// Create a copy of RootKey
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RootKeyImplCopyWith<_$RootKeyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
