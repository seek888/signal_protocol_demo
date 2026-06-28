// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prekey_bundle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PreKeyBundle _$PreKeyBundleFromJson(Map<String, dynamic> json) {
  return _PreKeyBundle.fromJson(json);
}

/// @nodoc
mixin _$PreKeyBundle {
  int get registrationId => throw _privateConstructorUsedError;
  int get deviceId => throw _privateConstructorUsedError;
  int get signedPreKeyId => throw _privateConstructorUsedError;
  @Uint8ListConverter()
  Uint8List get signedPreKey => throw _privateConstructorUsedError;
  @Uint8ListConverter()
  Uint8List get signedPreKeySignature => throw _privateConstructorUsedError;
  @NullableUint8ListConverter()
  Uint8List? get oneTimePreKey => throw _privateConstructorUsedError;
  int? get oneTimePreKeyId => throw _privateConstructorUsedError;
  @Uint8ListConverter()
  Uint8List get identityKey => throw _privateConstructorUsedError;

  /// Serializes this PreKeyBundle to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PreKeyBundle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PreKeyBundleCopyWith<PreKeyBundle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreKeyBundleCopyWith<$Res> {
  factory $PreKeyBundleCopyWith(
    PreKeyBundle value,
    $Res Function(PreKeyBundle) then,
  ) = _$PreKeyBundleCopyWithImpl<$Res, PreKeyBundle>;
  @useResult
  $Res call({
    int registrationId,
    int deviceId,
    int signedPreKeyId,
    @Uint8ListConverter() Uint8List signedPreKey,
    @Uint8ListConverter() Uint8List signedPreKeySignature,
    @NullableUint8ListConverter() Uint8List? oneTimePreKey,
    int? oneTimePreKeyId,
    @Uint8ListConverter() Uint8List identityKey,
  });
}

/// @nodoc
class _$PreKeyBundleCopyWithImpl<$Res, $Val extends PreKeyBundle>
    implements $PreKeyBundleCopyWith<$Res> {
  _$PreKeyBundleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PreKeyBundle
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? registrationId = null,
    Object? deviceId = null,
    Object? signedPreKeyId = null,
    Object? signedPreKey = null,
    Object? signedPreKeySignature = null,
    Object? oneTimePreKey = freezed,
    Object? oneTimePreKeyId = freezed,
    Object? identityKey = null,
  }) {
    return _then(
      _value.copyWith(
            registrationId: null == registrationId
                ? _value.registrationId
                : registrationId // ignore: cast_nullable_to_non_nullable
                      as int,
            deviceId: null == deviceId
                ? _value.deviceId
                : deviceId // ignore: cast_nullable_to_non_nullable
                      as int,
            signedPreKeyId: null == signedPreKeyId
                ? _value.signedPreKeyId
                : signedPreKeyId // ignore: cast_nullable_to_non_nullable
                      as int,
            signedPreKey: null == signedPreKey
                ? _value.signedPreKey
                : signedPreKey // ignore: cast_nullable_to_non_nullable
                      as Uint8List,
            signedPreKeySignature: null == signedPreKeySignature
                ? _value.signedPreKeySignature
                : signedPreKeySignature // ignore: cast_nullable_to_non_nullable
                      as Uint8List,
            oneTimePreKey: freezed == oneTimePreKey
                ? _value.oneTimePreKey
                : oneTimePreKey // ignore: cast_nullable_to_non_nullable
                      as Uint8List?,
            oneTimePreKeyId: freezed == oneTimePreKeyId
                ? _value.oneTimePreKeyId
                : oneTimePreKeyId // ignore: cast_nullable_to_non_nullable
                      as int?,
            identityKey: null == identityKey
                ? _value.identityKey
                : identityKey // ignore: cast_nullable_to_non_nullable
                      as Uint8List,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PreKeyBundleImplCopyWith<$Res>
    implements $PreKeyBundleCopyWith<$Res> {
  factory _$$PreKeyBundleImplCopyWith(
    _$PreKeyBundleImpl value,
    $Res Function(_$PreKeyBundleImpl) then,
  ) = __$$PreKeyBundleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int registrationId,
    int deviceId,
    int signedPreKeyId,
    @Uint8ListConverter() Uint8List signedPreKey,
    @Uint8ListConverter() Uint8List signedPreKeySignature,
    @NullableUint8ListConverter() Uint8List? oneTimePreKey,
    int? oneTimePreKeyId,
    @Uint8ListConverter() Uint8List identityKey,
  });
}

/// @nodoc
class __$$PreKeyBundleImplCopyWithImpl<$Res>
    extends _$PreKeyBundleCopyWithImpl<$Res, _$PreKeyBundleImpl>
    implements _$$PreKeyBundleImplCopyWith<$Res> {
  __$$PreKeyBundleImplCopyWithImpl(
    _$PreKeyBundleImpl _value,
    $Res Function(_$PreKeyBundleImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PreKeyBundle
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? registrationId = null,
    Object? deviceId = null,
    Object? signedPreKeyId = null,
    Object? signedPreKey = null,
    Object? signedPreKeySignature = null,
    Object? oneTimePreKey = freezed,
    Object? oneTimePreKeyId = freezed,
    Object? identityKey = null,
  }) {
    return _then(
      _$PreKeyBundleImpl(
        registrationId: null == registrationId
            ? _value.registrationId
            : registrationId // ignore: cast_nullable_to_non_nullable
                  as int,
        deviceId: null == deviceId
            ? _value.deviceId
            : deviceId // ignore: cast_nullable_to_non_nullable
                  as int,
        signedPreKeyId: null == signedPreKeyId
            ? _value.signedPreKeyId
            : signedPreKeyId // ignore: cast_nullable_to_non_nullable
                  as int,
        signedPreKey: null == signedPreKey
            ? _value.signedPreKey
            : signedPreKey // ignore: cast_nullable_to_non_nullable
                  as Uint8List,
        signedPreKeySignature: null == signedPreKeySignature
            ? _value.signedPreKeySignature
            : signedPreKeySignature // ignore: cast_nullable_to_non_nullable
                  as Uint8List,
        oneTimePreKey: freezed == oneTimePreKey
            ? _value.oneTimePreKey
            : oneTimePreKey // ignore: cast_nullable_to_non_nullable
                  as Uint8List?,
        oneTimePreKeyId: freezed == oneTimePreKeyId
            ? _value.oneTimePreKeyId
            : oneTimePreKeyId // ignore: cast_nullable_to_non_nullable
                  as int?,
        identityKey: null == identityKey
            ? _value.identityKey
            : identityKey // ignore: cast_nullable_to_non_nullable
                  as Uint8List,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PreKeyBundleImpl implements _PreKeyBundle {
  const _$PreKeyBundleImpl({
    required this.registrationId,
    required this.deviceId,
    required this.signedPreKeyId,
    @Uint8ListConverter() required this.signedPreKey,
    @Uint8ListConverter() required this.signedPreKeySignature,
    @NullableUint8ListConverter() this.oneTimePreKey,
    this.oneTimePreKeyId,
    @Uint8ListConverter() required this.identityKey,
  });

  factory _$PreKeyBundleImpl.fromJson(Map<String, dynamic> json) =>
      _$$PreKeyBundleImplFromJson(json);

  @override
  final int registrationId;
  @override
  final int deviceId;
  @override
  final int signedPreKeyId;
  @override
  @Uint8ListConverter()
  final Uint8List signedPreKey;
  @override
  @Uint8ListConverter()
  final Uint8List signedPreKeySignature;
  @override
  @NullableUint8ListConverter()
  final Uint8List? oneTimePreKey;
  @override
  final int? oneTimePreKeyId;
  @override
  @Uint8ListConverter()
  final Uint8List identityKey;

  @override
  String toString() {
    return 'PreKeyBundle(registrationId: $registrationId, deviceId: $deviceId, signedPreKeyId: $signedPreKeyId, signedPreKey: $signedPreKey, signedPreKeySignature: $signedPreKeySignature, oneTimePreKey: $oneTimePreKey, oneTimePreKeyId: $oneTimePreKeyId, identityKey: $identityKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PreKeyBundleImpl &&
            (identical(other.registrationId, registrationId) ||
                other.registrationId == registrationId) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.signedPreKeyId, signedPreKeyId) ||
                other.signedPreKeyId == signedPreKeyId) &&
            const DeepCollectionEquality().equals(
              other.signedPreKey,
              signedPreKey,
            ) &&
            const DeepCollectionEquality().equals(
              other.signedPreKeySignature,
              signedPreKeySignature,
            ) &&
            const DeepCollectionEquality().equals(
              other.oneTimePreKey,
              oneTimePreKey,
            ) &&
            (identical(other.oneTimePreKeyId, oneTimePreKeyId) ||
                other.oneTimePreKeyId == oneTimePreKeyId) &&
            const DeepCollectionEquality().equals(
              other.identityKey,
              identityKey,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    registrationId,
    deviceId,
    signedPreKeyId,
    const DeepCollectionEquality().hash(signedPreKey),
    const DeepCollectionEquality().hash(signedPreKeySignature),
    const DeepCollectionEquality().hash(oneTimePreKey),
    oneTimePreKeyId,
    const DeepCollectionEquality().hash(identityKey),
  );

  /// Create a copy of PreKeyBundle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PreKeyBundleImplCopyWith<_$PreKeyBundleImpl> get copyWith =>
      __$$PreKeyBundleImplCopyWithImpl<_$PreKeyBundleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PreKeyBundleImplToJson(this);
  }
}

abstract class _PreKeyBundle implements PreKeyBundle {
  const factory _PreKeyBundle({
    required final int registrationId,
    required final int deviceId,
    required final int signedPreKeyId,
    @Uint8ListConverter() required final Uint8List signedPreKey,
    @Uint8ListConverter() required final Uint8List signedPreKeySignature,
    @NullableUint8ListConverter() final Uint8List? oneTimePreKey,
    final int? oneTimePreKeyId,
    @Uint8ListConverter() required final Uint8List identityKey,
  }) = _$PreKeyBundleImpl;

  factory _PreKeyBundle.fromJson(Map<String, dynamic> json) =
      _$PreKeyBundleImpl.fromJson;

  @override
  int get registrationId;
  @override
  int get deviceId;
  @override
  int get signedPreKeyId;
  @override
  @Uint8ListConverter()
  Uint8List get signedPreKey;
  @override
  @Uint8ListConverter()
  Uint8List get signedPreKeySignature;
  @override
  @NullableUint8ListConverter()
  Uint8List? get oneTimePreKey;
  @override
  int? get oneTimePreKeyId;
  @override
  @Uint8ListConverter()
  Uint8List get identityKey;

  /// Create a copy of PreKeyBundle
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PreKeyBundleImplCopyWith<_$PreKeyBundleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
