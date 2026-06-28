import '../../domain/services/signal_session_service.dart';

class EncryptMessageUseCase {
  final SignalSessionService _service;
  EncryptMessageUseCase(this._service);

  Future<EncryptedResult> execute(String plaintext) async {
    return await _service.encryptMessage(plaintext);
  }
}
