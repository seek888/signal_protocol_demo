import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../../../app/di/injection.dart';
import '../../../../domain/services/signal_session_service.dart';
import '../../../../domain/usecases/initialize_session_usecase.dart';
import '../../../../domain/usecases/encrypt_message_usecase.dart';
import '../../../../domain/usecases/decrypt_message_usecase.dart';
import '../viewmodels/chat_state.dart';

final chatViewModelProvider =
    StateNotifierProvider<ChatViewModel, ChatState>((ref) {
  return ChatViewModel();
});

class ChatViewModel extends StateNotifier<ChatState> {
  final _uuid = const Uuid();
  late final SignalSessionService _signalService;
  late final InitializeSessionUseCase _initUseCase;
  late final EncryptMessageUseCase _encryptUseCase;
  late final DecryptMessageUseCase _decryptUseCase;

  ChatViewModel() : super(const ChatState()) {
    _signalService = getIt<SignalSessionService>();
    _initUseCase = getIt<InitializeSessionUseCase>();
    _encryptUseCase = getIt<EncryptMessageUseCase>();
    _decryptUseCase = getIt<DecryptMessageUseCase>();
  }

  /// 当前发送方：'alice' 或 'bob'
  bool get _isAliceSender => state.currentSender == 'alice';

  /// 切换发送方
  void switchSender() {
    state = state.copyWith(
      currentSender: _isAliceSender ? 'bob' : 'alice',
      errorMessage: null,
    );
  }

  /// 初始化 Alice 和 Bob 身份，执行 X3DH 握手
  Future<void> establishSession() async {
    state = state.copyWith(isEstablishing: true, errorMessage: null);
    try {
      await _initUseCase.execute();
      state = state.copyWith(
        isEstablishing: false,
        isSessionEstablished: true,
        aliceIdentityKeyHex: _signalService.aliceIdentityKeyHex,
        bobIdentityKeyHex: _signalService.bobIdentityKeyHex,
        sharedSecretHex: _signalService.sharedSecretHex,
      );
    } catch (e) {
      state = state.copyWith(
        isEstablishing: false,
        errorMessage: e.toString(),
      );
    }
  }

  /// 发送加密消息
  ///
  /// 根据当前发送方（Alice 或 Bob），使用对应方向的 chain key 加密。
  /// 接收方自动解密并显示。
  Future<void> sendMessage(String text) async {
    if (!_signalService.isSessionEstablished) {
      state = state.copyWith(errorMessage: 'Session not established');
      return;
    }

    final isAlice = _isAliceSender;
    final direction = isAlice
        ? MessageDirection.aliceToBob
        : MessageDirection.bobToAlice;

    // UI 方向：Alice 发 = sent（右侧蓝），Bob 发 = received（左侧灰）
    final uiDirection = isAlice ? UIMessageDirection.sent : UIMessageDirection.received;
    // 接收方的 UI 方向相反
    final receiverUiDirection = isAlice ? UIMessageDirection.received : UIMessageDirection.sent;

    try {
      // === Step 1: 发送方加密 ===
      final result = await _encryptUseCase.execute(text, direction: direction);

      final senderMsg = ChatMessage(
        id: _uuid.v4(),
        text: text,
        direction: uiDirection,
        status: MessageStatus.encrypted,
        timestamp: DateTime.now(),
        ciphertextHex: _bytesToHex(result.ciphertext),
        messageKeyHex: _bytesToHex(result.messageKey),
        messageIndex: result.messageIndex,
      );

      // === Step 2: 插入接收方"传输中"占位消息 ===
      final receiverMsgId = _uuid.v4();
      final receiverTransitMsg = ChatMessage(
        id: receiverMsgId,
        text: '...',
        direction: receiverUiDirection,
        status: MessageStatus.pending,
        timestamp: DateTime.now(),
        ciphertextHex: _bytesToHex(result.ciphertext),
        messageKeyHex: _bytesToHex(result.messageKey),
        messageIndex: result.messageIndex,
      );

      state = state.copyWith(
        messages: [...state.messages, senderMsg, receiverTransitMsg],
        ratchetStepCount: state.ratchetStepCount + 1,
      );

      // === Step 3: 模拟网络传输延迟 ===
      await Future.delayed(const Duration(milliseconds: 800));

      // === Step 4: 接收方解密 ===
      final decryptedText = await _decryptUseCase.execute(
        result.ciphertext,
        result.messageIndex,
        direction: direction,
      );

      // 更新接收方消息为解密完成
      final messages = List<ChatMessage>.from(state.messages);
      final idx = messages.indexWhere((m) => m.id == receiverMsgId);
      if (idx >= 0) {
        messages[idx] = messages[idx].copyWith(
          text: decryptedText,
          status: MessageStatus.decrypted,
        );
      }

      state = state.copyWith(messages: messages);
    } catch (e) {
      state = state.copyWith(errorMessage: 'Encryption error: $e');
    }
  }

  void resetSession() {
    _signalService.reset();
    state = const ChatState();
  }

  void clearError() {
    state = state.copyWith(errorMessage: null);
  }

  String _bytesToHex(List<int> bytes) {
    return bytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join(' ');
  }
}
