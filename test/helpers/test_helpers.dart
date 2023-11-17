import 'package:ejara_test/navigation/router.dart';
import 'package:ejara_test/services/service_locator.dart';
import 'test_helpers.mock.dart';

MockAppLevelRouter getAndRegisterAppLevelRouter() {
  _removeRegistrationIfExists<AppLevelRouter>();
  final service = MockAppLevelRouter();
  serviceLocator.registerSingleton<AppLevelRouter>(service);
  return service;
}

void _removeRegistrationIfExists<T extends Object>() {
  if (serviceLocator.isRegistered<T>()) {
    serviceLocator.unregister<T>();
  }
}
