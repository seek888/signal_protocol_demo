import '../../domain/services/signal_session_service.dart';

class InitializeSessionUseCase {
  final SignalSessionService _service;
  InitializeSessionUseCase(this._service);

  Future<void> execute() async {
    await _service.performX3DHHandshake();
  }
}
