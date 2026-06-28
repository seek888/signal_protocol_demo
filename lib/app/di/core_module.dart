import '../../domain/services/signal_session_service.dart';
import '../../domain/usecases/initialize_session_usecase.dart';
import '../../domain/usecases/encrypt_message_usecase.dart';
import '../../domain/usecases/decrypt_message_usecase.dart';
import 'injection.dart';

void configureCoreModule() {
  // Signal Session Service (singleton — shared across features)
  getIt.registerLazySingleton<SignalSessionService>(() => SignalSessionService());

  // UseCases (factories — each call gets fresh instance with service reference)
  getIt.registerFactory<InitializeSessionUseCase>(
    () => InitializeSessionUseCase(getIt<SignalSessionService>()),
  );
  getIt.registerFactory<EncryptMessageUseCase>(
    () => EncryptMessageUseCase(getIt<SignalSessionService>()),
  );
  getIt.registerFactory<DecryptMessageUseCase>(
    () => DecryptMessageUseCase(getIt<SignalSessionService>()),
  );
}
