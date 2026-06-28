// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ratchet_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ReceiverChain _$ReceiverChainFromJson(Map<String, dynamic> json) {
  return _ReceiverChain.fromJson(json);
}

/// @nodoc
mixin _$ReceiverChain {
  @Uint8ListConverter()
  Uint8List get ratchetKey => throw _privateConstructorUsedError;
  ChainKey get chainKey => throw _privateConstructorUsedError;

  /// Serializes this ReceiverChain to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReceiverChain
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReceiverChainCopyWith<ReceiverChain> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReceiverChainCopyWith<$Res> {
  factory $ReceiverChainCopyWith(
    ReceiverChain value,
    $Res Function(ReceiverChain) then,
  ) = _$ReceiverChainCopyWithImpl<$Res, ReceiverChain>;
  @useResult
  $Res call({@Uint8ListConverter() Uint8List ratchetKey, ChainKey chainKey});

  $ChainKeyCopyWith<$Res> get chainKey;
}

/// @nodoc
class _$ReceiverChainCopyWithImpl<$Res, $Val extends ReceiverChain>
    implements $ReceiverChainCopyWith<$Res> {
  _$ReceiverChainCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReceiverChain
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? ratchetKey = null, Object? chainKey = null}) {
    return _then(
      _value.copyWith(
            ratchetKey: null == ratchetKey
                ? _value.ratchetKey
                : ratchetKey // ignore: cast_nullable_to_non_nullable
                      as Uint8List,
            chainKey: null == chainKey
                ? _value.chainKey
                : chainKey // ignore: cast_nullable_to_non_nullable
                      as ChainKey,
          )
          as $Val,
    );
  }

  /// Create a copy of ReceiverChain
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChainKeyCopyWith<$Res> get chainKey {
    return $ChainKeyCopyWith<$Res>(_value.chainKey, (value) {
      return _then(_value.copyWith(chainKey: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReceiverChainImplCopyWith<$Res>
    implements $ReceiverChainCopyWith<$Res> {
  factory _$$ReceiverChainImplCopyWith(
    _$ReceiverChainImpl value,
    $Res Function(_$ReceiverChainImpl) then,
  ) = __$$ReceiverChainImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@Uint8ListConverter() Uint8List ratchetKey, ChainKey chainKey});

  @override
  $ChainKeyCopyWith<$Res> get chainKey;
}

/// @nodoc
class __$$ReceiverChainImplCopyWithImpl<$Res>
    extends _$ReceiverChainCopyWithImpl<$Res, _$ReceiverChainImpl>
    implements _$$ReceiverChainImplCopyWith<$Res> {
  __$$ReceiverChainImplCopyWithImpl(
    _$ReceiverChainImpl _value,
    $Res Function(_$ReceiverChainImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ReceiverChain
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? ratchetKey = null, Object? chainKey = null}) {
    return _then(
      _$ReceiverChainImpl(
        ratchetKey: null == ratchetKey
            ? _value.ratchetKey
            : ratchetKey // ignore: cast_nullable_to_non_nullable
                  as Uint8List,
        chainKey: null == chainKey
            ? _value.chainKey
            : chainKey // ignore: cast_nullable_to_non_nullable
                  as ChainKey,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ReceiverChainImpl implements _ReceiverChain {
  const _$ReceiverChainImpl({
    @Uint8ListConverter() required this.ratchetKey,
    required this.chainKey,
  });

  factory _$ReceiverChainImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReceiverChainImplFromJson(json);

  @override
  @Uint8ListConverter()
  final Uint8List ratchetKey;
  @override
  final ChainKey chainKey;

  @override
  String toString() {
    return 'ReceiverChain(ratchetKey: $ratchetKey, chainKey: $chainKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReceiverChainImpl &&
            const DeepCollectionEquality().equals(
              other.ratchetKey,
              ratchetKey,
            ) &&
            (identical(other.chainKey, chainKey) ||
                other.chainKey == chainKey));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(ratchetKey),
    chainKey,
  );

  /// Create a copy of ReceiverChain
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReceiverChainImplCopyWith<_$ReceiverChainImpl> get copyWith =>
      __$$ReceiverChainImplCopyWithImpl<_$ReceiverChainImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReceiverChainImplToJson(this);
  }
}

abstract class _ReceiverChain implements ReceiverChain {
  const factory _ReceiverChain({
    @Uint8ListConverter() required final Uint8List ratchetKey,
    required final ChainKey chainKey,
  }) = _$ReceiverChainImpl;

  factory _ReceiverChain.fromJson(Map<String, dynamic> json) =
      _$ReceiverChainImpl.fromJson;

  @override
  @Uint8ListConverter()
  Uint8List get ratchetKey;
  @override
  ChainKey get chainKey;

  /// Create a copy of ReceiverChain
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReceiverChainImplCopyWith<_$ReceiverChainImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SkippedMessageKey _$SkippedMessageKeyFromJson(Map<String, dynamic> json) {
  return _SkippedMessageKey.fromJson(json);
}

/// @nodoc
mixin _$SkippedMessageKey {
  @Uint8ListConverter()
  Uint8List get ratchetKey => throw _privateConstructorUsedError;
  int get counter => throw _privateConstructorUsedError;
  MessageKeys get messageKeys => throw _privateConstructorUsedError;

  /// Serializes this SkippedMessageKey to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SkippedMessageKey
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SkippedMessageKeyCopyWith<SkippedMessageKey> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SkippedMessageKeyCopyWith<$Res> {
  factory $SkippedMessageKeyCopyWith(
    SkippedMessageKey value,
    $Res Function(SkippedMessageKey) then,
  ) = _$SkippedMessageKeyCopyWithImpl<$Res, SkippedMessageKey>;
  @useResult
  $Res call({
    @Uint8ListConverter() Uint8List ratchetKey,
    int counter,
    MessageKeys messageKeys,
  });

  $MessageKeysCopyWith<$Res> get messageKeys;
}

/// @nodoc
class _$SkippedMessageKeyCopyWithImpl<$Res, $Val extends SkippedMessageKey>
    implements $SkippedMessageKeyCopyWith<$Res> {
  _$SkippedMessageKeyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SkippedMessageKey
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ratchetKey = null,
    Object? counter = null,
    Object? messageKeys = null,
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
            messageKeys: null == messageKeys
                ? _value.messageKeys
                : messageKeys // ignore: cast_nullable_to_non_nullable
                      as MessageKeys,
          )
          as $Val,
    );
  }

  /// Create a copy of SkippedMessageKey
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MessageKeysCopyWith<$Res> get messageKeys {
    return $MessageKeysCopyWith<$Res>(_value.messageKeys, (value) {
      return _then(_value.copyWith(messageKeys: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SkippedMessageKeyImplCopyWith<$Res>
    implements $SkippedMessageKeyCopyWith<$Res> {
  factory _$$SkippedMessageKeyImplCopyWith(
    _$SkippedMessageKeyImpl value,
    $Res Function(_$SkippedMessageKeyImpl) then,
  ) = __$$SkippedMessageKeyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @Uint8ListConverter() Uint8List ratchetKey,
    int counter,
    MessageKeys messageKeys,
  });

  @override
  $MessageKeysCopyWith<$Res> get messageKeys;
}

/// @nodoc
class __$$SkippedMessageKeyImplCopyWithImpl<$Res>
    extends _$SkippedMessageKeyCopyWithImpl<$Res, _$SkippedMessageKeyImpl>
    implements _$$SkippedMessageKeyImplCopyWith<$Res> {
  __$$SkippedMessageKeyImplCopyWithImpl(
    _$SkippedMessageKeyImpl _value,
    $Res Function(_$SkippedMessageKeyImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SkippedMessageKey
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ratchetKey = null,
    Object? counter = null,
    Object? messageKeys = null,
  }) {
    return _then(
      _$SkippedMessageKeyImpl(
        ratchetKey: null == ratchetKey
            ? _value.ratchetKey
            : ratchetKey // ignore: cast_nullable_to_non_nullable
                  as Uint8List,
        counter: null == counter
            ? _value.counter
            : counter // ignore: cast_nullable_to_non_nullable
                  as int,
        messageKeys: null == messageKeys
            ? _value.messageKeys
            : messageKeys // ignore: cast_nullable_to_non_nullable
                  as MessageKeys,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SkippedMessageKeyImpl implements _SkippedMessageKey {
  const _$SkippedMessageKeyImpl({
    @Uint8ListConverter() required this.ratchetKey,
    required this.counter,
    required this.messageKeys,
  });

  factory _$SkippedMessageKeyImpl.fromJson(Map<String, dynamic> json) =>
      _$$SkippedMessageKeyImplFromJson(json);

  @override
  @Uint8ListConverter()
  final Uint8List ratchetKey;
  @override
  final int counter;
  @override
  final MessageKeys messageKeys;

  @override
  String toString() {
    return 'SkippedMessageKey(ratchetKey: $ratchetKey, counter: $counter, messageKeys: $messageKeys)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SkippedMessageKeyImpl &&
            const DeepCollectionEquality().equals(
              other.ratchetKey,
              ratchetKey,
            ) &&
            (identical(other.counter, counter) || other.counter == counter) &&
            (identical(other.messageKeys, messageKeys) ||
                other.messageKeys == messageKeys));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(ratchetKey),
    counter,
    messageKeys,
  );

  /// Create a copy of SkippedMessageKey
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SkippedMessageKeyImplCopyWith<_$SkippedMessageKeyImpl> get copyWith =>
      __$$SkippedMessageKeyImplCopyWithImpl<_$SkippedMessageKeyImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SkippedMessageKeyImplToJson(this);
  }
}

abstract class _SkippedMessageKey implements SkippedMessageKey {
  const factory _SkippedMessageKey({
    @Uint8ListConverter() required final Uint8List ratchetKey,
    required final int counter,
    required final MessageKeys messageKeys,
  }) = _$SkippedMessageKeyImpl;

  factory _SkippedMessageKey.fromJson(Map<String, dynamic> json) =
      _$SkippedMessageKeyImpl.fromJson;

  @override
  @Uint8ListConverter()
  Uint8List get ratchetKey;
  @override
  int get counter;
  @override
  MessageKeys get messageKeys;

  /// Create a copy of SkippedMessageKey
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SkippedMessageKeyImplCopyWith<_$SkippedMessageKeyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RatchetState _$RatchetStateFromJson(Map<String, dynamic> json) {
  return _RatchetState.fromJson(json);
}

/// @nodoc
mixin _$RatchetState {
  RootKey get rootKey => throw _privateConstructorUsedError;
  ECKeyPair get senderRatchetKeyPair => throw _privateConstructorUsedError;
  ChainKey get senderChainKey => throw _privateConstructorUsedError;
  List<ReceiverChain> get receiverChains => throw _privateConstructorUsedError;
  List<SkippedMessageKey> get skippedMessageKeys =>
      throw _privateConstructorUsedError;
  int get previousCounter => throw _privateConstructorUsedError;

  /// Serializes this RatchetState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RatchetState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RatchetStateCopyWith<RatchetState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RatchetStateCopyWith<$Res> {
  factory $RatchetStateCopyWith(
    RatchetState value,
    $Res Function(RatchetState) then,
  ) = _$RatchetStateCopyWithImpl<$Res, RatchetState>;
  @useResult
  $Res call({
    RootKey rootKey,
    ECKeyPair senderRatchetKeyPair,
    ChainKey senderChainKey,
    List<ReceiverChain> receiverChains,
    List<SkippedMessageKey> skippedMessageKeys,
    int previousCounter,
  });

  $RootKeyCopyWith<$Res> get rootKey;
  $ECKeyPairCopyWith<$Res> get senderRatchetKeyPair;
  $ChainKeyCopyWith<$Res> get senderChainKey;
}

/// @nodoc
class _$RatchetStateCopyWithImpl<$Res, $Val extends RatchetState>
    implements $RatchetStateCopyWith<$Res> {
  _$RatchetStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RatchetState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rootKey = null,
    Object? senderRatchetKeyPair = null,
    Object? senderChainKey = null,
    Object? receiverChains = null,
    Object? skippedMessageKeys = null,
    Object? previousCounter = null,
  }) {
    return _then(
      _value.copyWith(
            rootKey: null == rootKey
                ? _value.rootKey
                : rootKey // ignore: cast_nullable_to_non_nullable
                      as RootKey,
            senderRatchetKeyPair: null == senderRatchetKeyPair
                ? _value.senderRatchetKeyPair
                : senderRatchetKeyPair // ignore: cast_nullable_to_non_nullable
                      as ECKeyPair,
            senderChainKey: null == senderChainKey
                ? _value.senderChainKey
                : senderChainKey // ignore: cast_nullable_to_non_nullable
                      as ChainKey,
            receiverChains: null == receiverChains
                ? _value.receiverChains
                : receiverChains // ignore: cast_nullable_to_non_nullable
                      as List<ReceiverChain>,
            skippedMessageKeys: null == skippedMessageKeys
                ? _value.skippedMessageKeys
                : skippedMessageKeys // ignore: cast_nullable_to_non_nullable
                      as List<SkippedMessageKey>,
            previousCounter: null == previousCounter
                ? _value.previousCounter
                : previousCounter // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }

  /// Create a copy of RatchetState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RootKeyCopyWith<$Res> get rootKey {
    return $RootKeyCopyWith<$Res>(_value.rootKey, (value) {
      return _then(_value.copyWith(rootKey: value) as $Val);
    });
  }

  /// Create a copy of RatchetState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ECKeyPairCopyWith<$Res> get senderRatchetKeyPair {
    return $ECKeyPairCopyWith<$Res>(_value.senderRatchetKeyPair, (value) {
      return _then(_value.copyWith(senderRatchetKeyPair: value) as $Val);
    });
  }

  /// Create a copy of RatchetState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChainKeyCopyWith<$Res> get senderChainKey {
    return $ChainKeyCopyWith<$Res>(_value.senderChainKey, (value) {
      return _then(_value.copyWith(senderChainKey: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RatchetStateImplCopyWith<$Res>
    implements $RatchetStateCopyWith<$Res> {
  factory _$$RatchetStateImplCopyWith(
    _$RatchetStateImpl value,
    $Res Function(_$RatchetStateImpl) then,
  ) = __$$RatchetStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    RootKey rootKey,
    ECKeyPair senderRatchetKeyPair,
    ChainKey senderChainKey,
    List<ReceiverChain> receiverChains,
    List<SkippedMessageKey> skippedMessageKeys,
    int previousCounter,
  });

  @override
  $RootKeyCopyWith<$Res> get rootKey;
  @override
  $ECKeyPairCopyWith<$Res> get senderRatchetKeyPair;
  @override
  $ChainKeyCopyWith<$Res> get senderChainKey;
}

/// @nodoc
class __$$RatchetStateImplCopyWithImpl<$Res>
    extends _$RatchetStateCopyWithImpl<$Res, _$RatchetStateImpl>
    implements _$$RatchetStateImplCopyWith<$Res> {
  __$$RatchetStateImplCopyWithImpl(
    _$RatchetStateImpl _value,
    $Res Function(_$RatchetStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RatchetState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rootKey = null,
    Object? senderRatchetKeyPair = null,
    Object? senderChainKey = null,
    Object? receiverChains = null,
    Object? skippedMessageKeys = null,
    Object? previousCounter = null,
  }) {
    return _then(
      _$RatchetStateImpl(
        rootKey: null == rootKey
            ? _value.rootKey
            : rootKey // ignore: cast_nullable_to_non_nullable
                  as RootKey,
        senderRatchetKeyPair: null == senderRatchetKeyPair
            ? _value.senderRatchetKeyPair
            : senderRatchetKeyPair // ignore: cast_nullable_to_non_nullable
                  as ECKeyPair,
        senderChainKey: null == senderChainKey
            ? _value.senderChainKey
            : senderChainKey // ignore: cast_nullable_to_non_nullable
                  as ChainKey,
        receiverChains: null == receiverChains
            ? _value._receiverChains
            : receiverChains // ignore: cast_nullable_to_non_nullable
                  as List<ReceiverChain>,
        skippedMessageKeys: null == skippedMessageKeys
            ? _value._skippedMessageKeys
            : skippedMessageKeys // ignore: cast_nullable_to_non_nullable
                  as List<SkippedMessageKey>,
        previousCounter: null == previousCounter
            ? _value.previousCounter
            : previousCounter // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RatchetStateImpl implements _RatchetState {
  const _$RatchetStateImpl({
    required this.rootKey,
    required this.senderRatchetKeyPair,
    required this.senderChainKey,
    final List<ReceiverChain> receiverChains = const [],
    final List<SkippedMessageKey> skippedMessageKeys = const [],
    this.previousCounter = 0,
  }) : _receiverChains = receiverChains,
       _skippedMessageKeys = skippedMessageKeys;

  factory _$RatchetStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$RatchetStateImplFromJson(json);

  @override
  final RootKey rootKey;
  @override
  final ECKeyPair senderRatchetKeyPair;
  @override
  final ChainKey senderChainKey;
  final List<ReceiverChain> _receiverChains;
  @override
  @JsonKey()
  List<ReceiverChain> get receiverChains {
    if (_receiverChains is EqualUnmodifiableListView) return _receiverChains;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_receiverChains);
  }

  final List<SkippedMessageKey> _skippedMessageKeys;
  @override
  @JsonKey()
  List<SkippedMessageKey> get skippedMessageKeys {
    if (_skippedMessageKeys is EqualUnmodifiableListView)
      return _skippedMessageKeys;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_skippedMessageKeys);
  }

  @override
  @JsonKey()
  final int previousCounter;

  @override
  String toString() {
    return 'RatchetState(rootKey: $rootKey, senderRatchetKeyPair: $senderRatchetKeyPair, senderChainKey: $senderChainKey, receiverChains: $receiverChains, skippedMessageKeys: $skippedMessageKeys, previousCounter: $previousCounter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RatchetStateImpl &&
            (identical(other.rootKey, rootKey) || other.rootKey == rootKey) &&
            (identical(other.senderRatchetKeyPair, senderRatchetKeyPair) ||
                other.senderRatchetKeyPair == senderRatchetKeyPair) &&
            (identical(other.senderChainKey, senderChainKey) ||
                other.senderChainKey == senderChainKey) &&
            const DeepCollectionEquality().equals(
              other._receiverChains,
              _receiverChains,
            ) &&
            const DeepCollectionEquality().equals(
              other._skippedMessageKeys,
              _skippedMessageKeys,
            ) &&
            (identical(other.previousCounter, previousCounter) ||
                other.previousCounter == previousCounter));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    rootKey,
    senderRatchetKeyPair,
    senderChainKey,
    const DeepCollectionEquality().hash(_receiverChains),
    const DeepCollectionEquality().hash(_skippedMessageKeys),
    previousCounter,
  );

  /// Create a copy of RatchetState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RatchetStateImplCopyWith<_$RatchetStateImpl> get copyWith =>
      __$$RatchetStateImplCopyWithImpl<_$RatchetStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RatchetStateImplToJson(this);
  }
}

abstract class _RatchetState implements RatchetState {
  const factory _RatchetState({
    required final RootKey rootKey,
    required final ECKeyPair senderRatchetKeyPair,
    required final ChainKey senderChainKey,
    final List<ReceiverChain> receiverChains,
    final List<SkippedMessageKey> skippedMessageKeys,
    final int previousCounter,
  }) = _$RatchetStateImpl;

  factory _RatchetState.fromJson(Map<String, dynamic> json) =
      _$RatchetStateImpl.fromJson;

  @override
  RootKey get rootKey;
  @override
  ECKeyPair get senderRatchetKeyPair;
  @override
  ChainKey get senderChainKey;
  @override
  List<ReceiverChain> get receiverChains;
  @override
  List<SkippedMessageKey> get skippedMessageKeys;
  @override
  int get previousCounter;

  /// Create a copy of RatchetState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RatchetStateImplCopyWith<_$RatchetStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
