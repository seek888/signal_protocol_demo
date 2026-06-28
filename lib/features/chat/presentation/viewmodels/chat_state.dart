import 'package:freezed_annotation/freezed_annotation.dart';
part 'chat_state.freezed.dart';

enum UIMessageDirection { sent, received }
enum MessageStatus { pending, encrypted, decrypted, failed }

@freezed
class ChatMessage with _$ChatMessage {
  const factory ChatMessage({
    required String id,
    required String text,
    required UIMessageDirection direction,
    required MessageStatus status,
    required DateTime timestamp,
    String? ciphertextHex,
    String? messageKeyHex,
    int? messageIndex,
  }) = _ChatMessage;
}

@freezed
class ChatState with _$ChatState {
  const factory ChatState({
    @Default([]) List<ChatMessage> messages,
    @Default(false) bool isEstablishing,
    @Default(false) bool isSessionEstablished,
    @Default(0) int ratchetStepCount,
    @Default('alice') String currentSender,
    String? errorMessage,
    String? aliceIdentityKeyHex,
    String? bobIdentityKeyHex,
    String? sharedSecretHex,
  }) = _ChatState;
}
