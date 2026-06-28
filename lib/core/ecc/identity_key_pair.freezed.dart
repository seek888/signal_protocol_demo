// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'identity_key_pair.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

IdentityKeyPair _$IdentityKeyPairFromJson(Map<String, dynamic> json) {
  return _IdentityKeyPair.fromJson(json);
}

/// @nodoc
mixin _$IdentityKeyPair {
  @Uint8ListConverter()
  Uint8List get publicKey => throw _privateConstructorUsedError;
  @Uint8ListConverter()
  Uint8List get privateKey => throw _privateConstructorUsedError;

  /// Serializes this IdentityKeyPair to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of IdentityKeyPair
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IdentityKeyPairCopyWith<IdentityKeyPair> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IdentityKeyPairCopyWith<$Res> {
  factory $IdentityKeyPairCopyWith(
    IdentityKeyPair value,
    $Res Function(IdentityKeyPair) then,
  ) = _$IdentityKeyPairCopyWithImpl<$Res, IdentityKeyPair>;
  @useResult
  $Res call({
    @Uint8ListConverter() Uint8List publicKey,
    @Uint8ListConverter() Uint8List privateKey,
  });
}

/// @nodoc
class _$IdentityKeyPairCopyWithImpl<$Res, $Val extends IdentityKeyPair>
    implements $IdentityKeyPairCopyWith<$Res> {
  _$IdentityKeyPairCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IdentityKeyPair
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? publicKey = null, Object? privateKey = null}) {
    return _then(
      _value.copyWith(
            publicKey: null == publicKey
                ? _value.publicKey
                : publicKey // ignore: cast_nullable_to_non_nullable
                      as Uint8List,
            privateKey: null == privateKey
                ? _value.privateKey
                : privateKey // ignore: cast_nullable_to_non_nullable
                      as Uint8List,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$IdentityKeyPairImplCopyWith<$Res>
    implements $IdentityKeyPairCopyWith<$Res> {
  factory _$$IdentityKeyPairImplCopyWith(
    _$IdentityKeyPairImpl value,
    $Res Function(_$IdentityKeyPairImpl) then,
  ) = __$$IdentityKeyPairImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @Uint8ListConverter() Uint8List publicKey,
    @Uint8ListConverter() Uint8List privateKey,
  });
}

/// @nodoc
class __$$IdentityKeyPairImplCopyWithImpl<$Res>
    extends _$IdentityKeyPairCopyWithImpl<$Res, _$IdentityKeyPairImpl>
    implements _$$IdentityKeyPairImplCopyWith<$Res> {
  __$$IdentityKeyPairImplCopyWithImpl(
    _$IdentityKeyPairImpl _value,
    $Res Function(_$IdentityKeyPairImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of IdentityKeyPair
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? publicKey = null, Object? privateKey = null}) {
    return _then(
      _$IdentityKeyPairImpl(
        publicKey: null == publicKey
            ? _value.publicKey
            : publicKey // ignore: cast_nullable_to_non_nullable
                  as Uint8List,
        privateKey: null == privateKey
            ? _value.privateKey
            : privateKey // ignore: cast_nullable_to_non_nullable
                  as Uint8List,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$IdentityKeyPairImpl implements _IdentityKeyPair {
  const _$IdentityKeyPairImpl({
    @Uint8ListConverter() required this.publicKey,
    @Uint8ListConverter() required this.privateKey,
  });

  factory _$IdentityKeyPairImpl.fromJson(Map<String, dynamic> json) =>
      _$$IdentityKeyPairImplFromJson(json);

  @override
  @Uint8ListConverter()
  final Uint8List publicKey;
  @override
  @Uint8ListConverter()
  final Uint8List privateKey;

  @override
  String toString() {
    return 'IdentityKeyPair(publicKey: $publicKey, privateKey: $privateKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IdentityKeyPairImpl &&
            const DeepCollectionEquality().equals(other.publicKey, publicKey) &&
            const DeepCollectionEquality().equals(
              other.privateKey,
              privateKey,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(publicKey),
    const DeepCollectionEquality().hash(privateKey),
  );

  /// Create a copy of IdentityKeyPair
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IdentityKeyPairImplCopyWith<_$IdentityKeyPairImpl> get copyWith =>
      __$$IdentityKeyPairImplCopyWithImpl<_$IdentityKeyPairImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$IdentityKeyPairImplToJson(this);
  }
}

abstract class _IdentityKeyPair implements IdentityKeyPair {
  const factory _IdentityKeyPair({
    @Uint8ListConverter() required final Uint8List publicKey,
    @Uint8ListConverter() required final Uint8List privateKey,
  }) = _$IdentityKeyPairImpl;

  factory _IdentityKeyPair.fromJson(Map<String, dynamic> json) =
      _$IdentityKeyPairImpl.fromJson;

  @override
  @Uint8ListConverter()
  Uint8List get publicKey;
  @override
  @Uint8ListConverter()
  Uint8List get privateKey;

  /// Create a copy of IdentityKeyPair
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IdentityKeyPairImplCopyWith<_$IdentityKeyPairImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
