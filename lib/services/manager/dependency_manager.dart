import 'package:ejara_test/navigation/router.dart';
import 'package:ejara_test/services/environment.dart';
import 'package:ejara_test/services/service_locator.dart';

class DependencyManager {
  EnvironmentType type;

  DependencyManager({required this.type}) {
    provideEnvironment();
    provideAppLevelRouter();
  }

  Future<void> init() async {
    await serviceLocator.allReady();
  }

  void provideEnvironment() {
    serviceLocator.registerSingleton<EnvironmentConfig>(Environment.init(type: type));
  }

  void provideAppLevelRouter() {
    serviceLocator.registerSingleton<AppLevelRouter>(AppLevelRouter());
  }

   Future<void> dispose() async {
    await serviceLocator.reset(dispose: true);
  }
}
