// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ChatMessage {
  String get id => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  UIMessageDirection get direction => throw _privateConstructorUsedError;
  MessageStatus get status => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  String? get ciphertextHex => throw _privateConstructorUsedError;
  String? get messageKeyHex => throw _privateConstructorUsedError;
  int? get messageIndex => throw _privateConstructorUsedError;

  /// Create a copy of ChatMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatMessageCopyWith<ChatMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatMessageCopyWith<$Res> {
  factory $ChatMessageCopyWith(
    ChatMessage value,
    $Res Function(ChatMessage) then,
  ) = _$ChatMessageCopyWithImpl<$Res, ChatMessage>;
  @useResult
  $Res call({
    String id,
    String text,
    UIMessageDirection direction,
    MessageStatus status,
    DateTime timestamp,
    String? ciphertextHex,
    String? messageKeyHex,
    int? messageIndex,
  });
}

/// @nodoc
class _$ChatMessageCopyWithImpl<$Res, $Val extends ChatMessage>
    implements $ChatMessageCopyWith<$Res> {
  _$ChatMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? direction = null,
    Object? status = null,
    Object? timestamp = null,
    Object? ciphertextHex = freezed,
    Object? messageKeyHex = freezed,
    Object? messageIndex = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            text: null == text
                ? _value.text
                : text // ignore: cast_nullable_to_non_nullable
                      as String,
            direction: null == direction
                ? _value.direction
                : direction // ignore: cast_nullable_to_non_nullable
                      as UIMessageDirection,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as MessageStatus,
            timestamp: null == timestamp
                ? _value.timestamp
                : timestamp // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            ciphertextHex: freezed == ciphertextHex
                ? _value.ciphertextHex
                : ciphertextHex // ignore: cast_nullable_to_non_nullable
                      as String?,
            messageKeyHex: freezed == messageKeyHex
                ? _value.messageKeyHex
                : messageKeyHex // ignore: cast_nullable_to_non_nullable
                      as String?,
            messageIndex: freezed == messageIndex
                ? _value.messageIndex
                : messageIndex // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ChatMessageImplCopyWith<$Res>
    implements $ChatMessageCopyWith<$Res> {
  factory _$$ChatMessageImplCopyWith(
    _$ChatMessageImpl value,
    $Res Function(_$ChatMessageImpl) then,
  ) = __$$ChatMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String text,
    UIMessageDirection direction,
    MessageStatus status,
    DateTime timestamp,
    String? ciphertextHex,
    String? messageKeyHex,
    int? messageIndex,
  });
}

/// @nodoc
class __$$ChatMessageImplCopyWithImpl<$Res>
    extends _$ChatMessageCopyWithImpl<$Res, _$ChatMessageImpl>
    implements _$$ChatMessageImplCopyWith<$Res> {
  __$$ChatMessageImplCopyWithImpl(
    _$ChatMessageImpl _value,
    $Res Function(_$ChatMessageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? direction = null,
    Object? status = null,
    Object? timestamp = null,
    Object? ciphertextHex = freezed,
    Object? messageKeyHex = freezed,
    Object? messageIndex = freezed,
  }) {
    return _then(
      _$ChatMessageImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        text: null == text
            ? _value.text
            : text // ignore: cast_nullable_to_non_nullable
                  as String,
        direction: null == direction
            ? _value.direction
            : direction // ignore: cast_nullable_to_non_nullable
                  as UIMessageDirection,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as MessageStatus,
        timestamp: null == timestamp
            ? _value.timestamp
            : timestamp // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        ciphertextHex: freezed == ciphertextHex
            ? _value.ciphertextHex
            : ciphertextHex // ignore: cast_nullable_to_non_nullable
                  as String?,
        messageKeyHex: freezed == messageKeyHex
            ? _value.messageKeyHex
            : messageKeyHex // ignore: cast_nullable_to_non_nullable
                  as String?,
        messageIndex: freezed == messageIndex
            ? _value.messageIndex
            : messageIndex // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc

class _$ChatMessageImpl implements _ChatMessage {
  const _$ChatMessageImpl({
    required this.id,
    required this.text,
    required this.direction,
    required this.status,
    required this.timestamp,
    this.ciphertextHex,
    this.messageKeyHex,
    this.messageIndex,
  });

  @override
  final String id;
  @override
  final String text;
  @override
  final UIMessageDirection direction;
  @override
  final MessageStatus status;
  @override
  final DateTime timestamp;
  @override
  final String? ciphertextHex;
  @override
  final String? messageKeyHex;
  @override
  final int? messageIndex;

  @override
  String toString() {
    return 'ChatMessage(id: $id, text: $text, direction: $direction, status: $status, timestamp: $timestamp, ciphertextHex: $ciphertextHex, messageKeyHex: $messageKeyHex, messageIndex: $messageIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatMessageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.direction, direction) ||
                other.direction == direction) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.ciphertextHex, ciphertextHex) ||
                other.ciphertextHex == ciphertextHex) &&
            (identical(other.messageKeyHex, messageKeyHex) ||
                other.messageKeyHex == messageKeyHex) &&
            (identical(other.messageIndex, messageIndex) ||
                other.messageIndex == messageIndex));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    text,
    direction,
    status,
    timestamp,
    ciphertextHex,
    messageKeyHex,
    messageIndex,
  );

  /// Create a copy of ChatMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatMessageImplCopyWith<_$ChatMessageImpl> get copyWith =>
      __$$ChatMessageImplCopyWithImpl<_$ChatMessageImpl>(this, _$identity);
}

abstract class _ChatMessage implements ChatMessage {
  const factory _ChatMessage({
    required final String id,
    required final String text,
    required final UIMessageDirection direction,
    required final MessageStatus status,
    required final DateTime timestamp,
    final String? ciphertextHex,
    final String? messageKeyHex,
    final int? messageIndex,
  }) = _$ChatMessageImpl;

  @override
  String get id;
  @override
  String get text;
  @override
  UIMessageDirection get direction;
  @override
  MessageStatus get status;
  @override
  DateTime get timestamp;
  @override
  String? get ciphertextHex;
  @override
  String? get messageKeyHex;
  @override
  int? get messageIndex;

  /// Create a copy of ChatMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatMessageImplCopyWith<_$ChatMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ChatState {
  List<ChatMessage> get messages => throw _privateConstructorUsedError;
  bool get isEstablishing => throw _privateConstructorUsedError;
  bool get isSessionEstablished => throw _privateConstructorUsedError;
  int get ratchetStepCount => throw _privateConstructorUsedError;
  String get currentSender => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  String? get aliceIdentityKeyHex => throw _privateConstructorUsedError;
  String? get bobIdentityKeyHex => throw _privateConstructorUsedError;
  String? get sharedSecretHex => throw _privateConstructorUsedError;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatStateCopyWith<ChatState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatStateCopyWith<$Res> {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) then) =
      _$ChatStateCopyWithImpl<$Res, ChatState>;
  @useResult
  $Res call({
    List<ChatMessage> messages,
    bool isEstablishing,
    bool isSessionEstablished,
    int ratchetStepCount,
    String currentSender,
    String? errorMessage,
    String? aliceIdentityKeyHex,
    String? bobIdentityKeyHex,
    String? sharedSecretHex,
  });
}

/// @nodoc
class _$ChatStateCopyWithImpl<$Res, $Val extends ChatState>
    implements $ChatStateCopyWith<$Res> {
  _$ChatStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
    Object? isEstablishing = null,
    Object? isSessionEstablished = null,
    Object? ratchetStepCount = null,
    Object? currentSender = null,
    Object? errorMessage = freezed,
    Object? aliceIdentityKeyHex = freezed,
    Object? bobIdentityKeyHex = freezed,
    Object? sharedSecretHex = freezed,
  }) {
    return _then(
      _value.copyWith(
            messages: null == messages
                ? _value.messages
                : messages // ignore: cast_nullable_to_non_nullable
                      as List<ChatMessage>,
            isEstablishing: null == isEstablishing
                ? _value.isEstablishing
                : isEstablishing // ignore: cast_nullable_to_non_nullable
                      as bool,
            isSessionEstablished: null == isSessionEstablished
                ? _value.isSessionEstablished
                : isSessionEstablished // ignore: cast_nullable_to_non_nullable
                      as bool,
            ratchetStepCount: null == ratchetStepCount
                ? _value.ratchetStepCount
                : ratchetStepCount // ignore: cast_nullable_to_non_nullable
                      as int,
            currentSender: null == currentSender
                ? _value.currentSender
                : currentSender // ignore: cast_nullable_to_non_nullable
                      as String,
            errorMessage: freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
            aliceIdentityKeyHex: freezed == aliceIdentityKeyHex
                ? _value.aliceIdentityKeyHex
                : aliceIdentityKeyHex // ignore: cast_nullable_to_non_nullable
                      as String?,
            bobIdentityKeyHex: freezed == bobIdentityKeyHex
                ? _value.bobIdentityKeyHex
                : bobIdentityKeyHex // ignore: cast_nullable_to_non_nullable
                      as String?,
            sharedSecretHex: freezed == sharedSecretHex
                ? _value.sharedSecretHex
                : sharedSecretHex // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ChatStateImplCopyWith<$Res>
    implements $ChatStateCopyWith<$Res> {
  factory _$$ChatStateImplCopyWith(
    _$ChatStateImpl value,
    $Res Function(_$ChatStateImpl) then,
  ) = __$$ChatStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<ChatMessage> messages,
    bool isEstablishing,
    bool isSessionEstablished,
    int ratchetStepCount,
    String currentSender,
    String? errorMessage,
    String? aliceIdentityKeyHex,
    String? bobIdentityKeyHex,
    String? sharedSecretHex,
  });
}

/// @nodoc
class __$$ChatStateImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$ChatStateImpl>
    implements _$$ChatStateImplCopyWith<$Res> {
  __$$ChatStateImplCopyWithImpl(
    _$ChatStateImpl _value,
    $Res Function(_$ChatStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
    Object? isEstablishing = null,
    Object? isSessionEstablished = null,
    Object? ratchetStepCount = null,
    Object? currentSender = null,
    Object? errorMessage = freezed,
    Object? aliceIdentityKeyHex = freezed,
    Object? bobIdentityKeyHex = freezed,
    Object? sharedSecretHex = freezed,
  }) {
    return _then(
      _$ChatStateImpl(
        messages: null == messages
            ? _value._messages
            : messages // ignore: cast_nullable_to_non_nullable
                  as List<ChatMessage>,
        isEstablishing: null == isEstablishing
            ? _value.isEstablishing
            : isEstablishing // ignore: cast_nullable_to_non_nullable
                  as bool,
        isSessionEstablished: null == isSessionEstablished
            ? _value.isSessionEstablished
            : isSessionEstablished // ignore: cast_nullable_to_non_nullable
                  as bool,
        ratchetStepCount: null == ratchetStepCount
            ? _value.ratchetStepCount
            : ratchetStepCount // ignore: cast_nullable_to_non_nullable
                  as int,
        currentSender: null == currentSender
            ? _value.currentSender
            : currentSender // ignore: cast_nullable_to_non_nullable
                  as String,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
        aliceIdentityKeyHex: freezed == aliceIdentityKeyHex
            ? _value.aliceIdentityKeyHex
            : aliceIdentityKeyHex // ignore: cast_nullable_to_non_nullable
                  as String?,
        bobIdentityKeyHex: freezed == bobIdentityKeyHex
            ? _value.bobIdentityKeyHex
            : bobIdentityKeyHex // ignore: cast_nullable_to_non_nullable
                  as String?,
        sharedSecretHex: freezed == sharedSecretHex
            ? _value.sharedSecretHex
            : sharedSecretHex // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$ChatStateImpl implements _ChatState {
  const _$ChatStateImpl({
    final List<ChatMessage> messages = const [],
    this.isEstablishing = false,
    this.isSessionEstablished = false,
    this.ratchetStepCount = 0,
    this.currentSender = 'alice',
    this.errorMessage,
    this.aliceIdentityKeyHex,
    this.bobIdentityKeyHex,
    this.sharedSecretHex,
  }) : _messages = messages;

  final List<ChatMessage> _messages;
  @override
  @JsonKey()
  List<ChatMessage> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  @JsonKey()
  final bool isEstablishing;
  @override
  @JsonKey()
  final bool isSessionEstablished;
  @override
  @JsonKey()
  final int ratchetStepCount;
  @override
  @JsonKey()
  final String currentSender;
  @override
  final String? errorMessage;
  @override
  final String? aliceIdentityKeyHex;
  @override
  final String? bobIdentityKeyHex;
  @override
  final String? sharedSecretHex;

  @override
  String toString() {
    return 'ChatState(messages: $messages, isEstablishing: $isEstablishing, isSessionEstablished: $isSessionEstablished, ratchetStepCount: $ratchetStepCount, currentSender: $currentSender, errorMessage: $errorMessage, aliceIdentityKeyHex: $aliceIdentityKeyHex, bobIdentityKeyHex: $bobIdentityKeyHex, sharedSecretHex: $sharedSecretHex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatStateImpl &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            (identical(other.isEstablishing, isEstablishing) ||
                other.isEstablishing == isEstablishing) &&
            (identical(other.isSessionEstablished, isSessionEstablished) ||
                other.isSessionEstablished == isSessionEstablished) &&
            (identical(other.ratchetStepCount, ratchetStepCount) ||
                other.ratchetStepCount == ratchetStepCount) &&
            (identical(other.currentSender, currentSender) ||
                other.currentSender == currentSender) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.aliceIdentityKeyHex, aliceIdentityKeyHex) ||
                other.aliceIdentityKeyHex == aliceIdentityKeyHex) &&
            (identical(other.bobIdentityKeyHex, bobIdentityKeyHex) ||
                other.bobIdentityKeyHex == bobIdentityKeyHex) &&
            (identical(other.sharedSecretHex, sharedSecretHex) ||
                other.sharedSecretHex == sharedSecretHex));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_messages),
    isEstablishing,
    isSessionEstablished,
    ratchetStepCount,
    currentSender,
    errorMessage,
    aliceIdentityKeyHex,
    bobIdentityKeyHex,
    sharedSecretHex,
  );

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatStateImplCopyWith<_$ChatStateImpl> get copyWith =>
      __$$ChatStateImplCopyWithImpl<_$ChatStateImpl>(this, _$identity);
}

abstract class _ChatState implements ChatState {
  const factory _ChatState({
    final List<ChatMessage> messages,
    final bool isEstablishing,
    final bool isSessionEstablished,
    final int ratchetStepCount,
    final String currentSender,
    final String? errorMessage,
    final String? aliceIdentityKeyHex,
    final String? bobIdentityKeyHex,
    final String? sharedSecretHex,
  }) = _$ChatStateImpl;

  @override
  List<ChatMessage> get messages;
  @override
  bool get isEstablishing;
  @override
  bool get isSessionEstablished;
  @override
  int get ratchetStepCount;
  @override
  String get currentSender;
  @override
  String? get errorMessage;
  @override
  String? get aliceIdentityKeyHex;
  @override
  String? get bobIdentityKeyHex;
  @override
  String? get sharedSecretHex;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatStateImplCopyWith<_$ChatStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
