import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import '../app/config/app_config.dart';
import 'injector.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetit',
  preferRelativeImports: true,
  asExtension: false,
)
configureDependencies(
    AppConfig appConfig) {
  getIt.registerSingleton<AppConfig>(
      appConfig);
  $initGetit(getIt);
}
