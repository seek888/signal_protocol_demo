import '../services/signal_session_service.dart';

class EncryptMessageUseCase {
  final SignalSessionService _service;
  EncryptMessageUseCase(this._service);

  Future<EncryptedResult> execute(
    String plaintext, {
    MessageDirection direction = MessageDirection.aliceToBob,
  }) {
    return _service.encryptMessage(plaintext, direction: direction);
  }
}
