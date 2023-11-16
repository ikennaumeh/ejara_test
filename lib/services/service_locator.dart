import 'package:ejara_test/navigation/router.dart';
import 'package:ejara_test/services/network_service.dart';
import 'package:ejara_test/services/secure_storage_service.dart';
import 'package:ejara_test/services/service_api.dart';
import 'package:get_it/get_it.dart';

GetIt get serviceLocator => GetIt.instance;

Future<void> setupLocator({
  String? environment,
}) async {

// Register dependencies
  serviceLocator.registerLazySingleton(() => AppLevelRouter());
  serviceLocator.registerLazySingleton(() => SecureStorageService());
  serviceLocator.registerLazySingleton(() => NetworkService());
  serviceLocator.registerLazySingleton(() => ServiceApi());
}

