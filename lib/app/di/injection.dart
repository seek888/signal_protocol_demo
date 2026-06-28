import 'package:get_it/get_it.dart';
import 'core_module.dart';
import 'data_module.dart';
import 'feature_module.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  configureCoreModule();
  configureDataModule();
  configureFeatureModule();
}
