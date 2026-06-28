import 'dart:typed_data';
import '../../domain/services/signal_session_service.dart';

class DecryptMessageUseCase {
  final SignalSessionService _service;
  DecryptMessageUseCase(this._service);

  Future<String> execute(Uint8List ciphertext, int messageIndex) async {
    return await _service.decryptMessage(ciphertext, messageIndex);
  }
}
