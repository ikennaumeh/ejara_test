import 'package:ejara_test/navigation/router.dart';
import 'package:ejara_test/services/environment.dart';
import 'package:ejara_test/services/network_service.dart';
import 'package:ejara_test/services/secure_storage_service.dart';
import 'package:ejara_test/services/service_api.dart';
import 'package:ejara_test/services/service_locator.dart';

class DependencyManager {
  EnvironmentType type;

  DependencyManager({required this.type}) {
    provideEnvironment();
    provideAppLevelRouter();
    provideNetworkService();
    provideSecureStorageService();
    provideServiceApi();
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

  void provideNetworkService() {
    serviceLocator.registerSingleton<NetworkService>(NetworkService());
  }

  void provideSecureStorageService() {
    serviceLocator.registerSingleton<SecureStorageService>(SecureStorageService());
  }

  void provideServiceApi() {
    serviceLocator.registerSingleton<ServiceApi>(ServiceApi());
  }

  Future<void> dispose() async {
    await serviceLocator.reset(dispose: true);
  }
}
