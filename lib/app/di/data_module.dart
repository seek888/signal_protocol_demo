import 'injection.dart';
import '../../data/server/iserver_provider.dart';
import '../../data/server/mock/mock_server_provider.dart';

void configureDataModule() {
  getIt.registerLazySingleton<IServerProvider>(() => MockServerProvider());
}
