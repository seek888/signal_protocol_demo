import 'dart:typed_data';
import '../services/signal_session_service.dart';

class DecryptMessageUseCase {
  final SignalSessionService _service;
  DecryptMessageUseCase(this._service);

  Future<String> execute(
    Uint8List ciphertext,
    int messageIndex, {
    MessageDirection direction = MessageDirection.aliceToBob,
  }) {
    return _service.decryptMessage(ciphertext, messageIndex, direction: direction);
  }
}
