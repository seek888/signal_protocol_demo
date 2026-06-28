// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ec_key_pair.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ECKeyPair _$ECKeyPairFromJson(Map<String, dynamic> json) {
  return _ECKeyPair.fromJson(json);
}

/// @nodoc
mixin _$ECKeyPair {
  @Uint8ListConverter()
  Uint8List get publicKey => throw _privateConstructorUsedError;
  @Uint8ListConverter()
  Uint8List get privateKey => throw _privateConstructorUsedError;

  /// Serializes this ECKeyPair to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ECKeyPair
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ECKeyPairCopyWith<ECKeyPair> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ECKeyPairCopyWith<$Res> {
  factory $ECKeyPairCopyWith(ECKeyPair value, $Res Function(ECKeyPair) then) =
      _$ECKeyPairCopyWithImpl<$Res, ECKeyPair>;
  @useResult
  $Res call({
    @Uint8ListConverter() Uint8List publicKey,
    @Uint8ListConverter() Uint8List privateKey,
  });
}

/// @nodoc
class _$ECKeyPairCopyWithImpl<$Res, $Val extends ECKeyPair>
    implements $ECKeyPairCopyWith<$Res> {
  _$ECKeyPairCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ECKeyPair
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
abstract class _$$ECKeyPairImplCopyWith<$Res>
    implements $ECKeyPairCopyWith<$Res> {
  factory _$$ECKeyPairImplCopyWith(
    _$ECKeyPairImpl value,
    $Res Function(_$ECKeyPairImpl) then,
  ) = __$$ECKeyPairImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @Uint8ListConverter() Uint8List publicKey,
    @Uint8ListConverter() Uint8List privateKey,
  });
}

/// @nodoc
class __$$ECKeyPairImplCopyWithImpl<$Res>
    extends _$ECKeyPairCopyWithImpl<$Res, _$ECKeyPairImpl>
    implements _$$ECKeyPairImplCopyWith<$Res> {
  __$$ECKeyPairImplCopyWithImpl(
    _$ECKeyPairImpl _value,
    $Res Function(_$ECKeyPairImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ECKeyPair
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? publicKey = null, Object? privateKey = null}) {
    return _then(
      _$ECKeyPairImpl(
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
class _$ECKeyPairImpl implements _ECKeyPair {
  const _$ECKeyPairImpl({
    @Uint8ListConverter() required this.publicKey,
    @Uint8ListConverter() required this.privateKey,
  });

  factory _$ECKeyPairImpl.fromJson(Map<String, dynamic> json) =>
      _$$ECKeyPairImplFromJson(json);

  @override
  @Uint8ListConverter()
  final Uint8List publicKey;
  @override
  @Uint8ListConverter()
  final Uint8List privateKey;

  @override
  String toString() {
    return 'ECKeyPair(publicKey: $publicKey, privateKey: $privateKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ECKeyPairImpl &&
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

  /// Create a copy of ECKeyPair
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ECKeyPairImplCopyWith<_$ECKeyPairImpl> get copyWith =>
      __$$ECKeyPairImplCopyWithImpl<_$ECKeyPairImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ECKeyPairImplToJson(this);
  }
}

abstract class _ECKeyPair implements ECKeyPair {
  const factory _ECKeyPair({
    @Uint8ListConverter() required final Uint8List publicKey,
    @Uint8ListConverter() required final Uint8List privateKey,
  }) = _$ECKeyPairImpl;

  factory _ECKeyPair.fromJson(Map<String, dynamic> json) =
      _$ECKeyPairImpl.fromJson;

  @override
  @Uint8ListConverter()
  Uint8List get publicKey;
  @override
  @Uint8ListConverter()
  Uint8List get privateKey;

  /// Create a copy of ECKeyPair
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ECKeyPairImplCopyWith<_$ECKeyPairImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
