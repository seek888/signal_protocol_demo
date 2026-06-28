// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'identity_key.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

IdentityKey _$IdentityKeyFromJson(Map<String, dynamic> json) {
  return _IdentityKey.fromJson(json);
}

/// @nodoc
mixin _$IdentityKey {
  @Uint8ListConverter()
  Uint8List get publicKey => throw _privateConstructorUsedError;

  /// Serializes this IdentityKey to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of IdentityKey
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IdentityKeyCopyWith<IdentityKey> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IdentityKeyCopyWith<$Res> {
  factory $IdentityKeyCopyWith(
    IdentityKey value,
    $Res Function(IdentityKey) then,
  ) = _$IdentityKeyCopyWithImpl<$Res, IdentityKey>;
  @useResult
  $Res call({@Uint8ListConverter() Uint8List publicKey});
}

/// @nodoc
class _$IdentityKeyCopyWithImpl<$Res, $Val extends IdentityKey>
    implements $IdentityKeyCopyWith<$Res> {
  _$IdentityKeyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IdentityKey
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? publicKey = null}) {
    return _then(
      _value.copyWith(
            publicKey: null == publicKey
                ? _value.publicKey
                : publicKey // ignore: cast_nullable_to_non_nullable
                      as Uint8List,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$IdentityKeyImplCopyWith<$Res>
    implements $IdentityKeyCopyWith<$Res> {
  factory _$$IdentityKeyImplCopyWith(
    _$IdentityKeyImpl value,
    $Res Function(_$IdentityKeyImpl) then,
  ) = __$$IdentityKeyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@Uint8ListConverter() Uint8List publicKey});
}

/// @nodoc
class __$$IdentityKeyImplCopyWithImpl<$Res>
    extends _$IdentityKeyCopyWithImpl<$Res, _$IdentityKeyImpl>
    implements _$$IdentityKeyImplCopyWith<$Res> {
  __$$IdentityKeyImplCopyWithImpl(
    _$IdentityKeyImpl _value,
    $Res Function(_$IdentityKeyImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of IdentityKey
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? publicKey = null}) {
    return _then(
      _$IdentityKeyImpl(
        publicKey: null == publicKey
            ? _value.publicKey
            : publicKey // ignore: cast_nullable_to_non_nullable
                  as Uint8List,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$IdentityKeyImpl implements _IdentityKey {
  const _$IdentityKeyImpl({@Uint8ListConverter() required this.publicKey});

  factory _$IdentityKeyImpl.fromJson(Map<String, dynamic> json) =>
      _$$IdentityKeyImplFromJson(json);

  @override
  @Uint8ListConverter()
  final Uint8List publicKey;

  @override
  String toString() {
    return 'IdentityKey(publicKey: $publicKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IdentityKeyImpl &&
            const DeepCollectionEquality().equals(other.publicKey, publicKey));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(publicKey));

  /// Create a copy of IdentityKey
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IdentityKeyImplCopyWith<_$IdentityKeyImpl> get copyWith =>
      __$$IdentityKeyImplCopyWithImpl<_$IdentityKeyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IdentityKeyImplToJson(this);
  }
}

abstract class _IdentityKey implements IdentityKey {
  const factory _IdentityKey({
    @Uint8ListConverter() required final Uint8List publicKey,
  }) = _$IdentityKeyImpl;

  factory _IdentityKey.fromJson(Map<String, dynamic> json) =
      _$IdentityKeyImpl.fromJson;

  @override
  @Uint8ListConverter()
  Uint8List get publicKey;

  /// Create a copy of IdentityKey
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IdentityKeyImplCopyWith<_$IdentityKeyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
