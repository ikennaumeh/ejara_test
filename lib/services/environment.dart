import 'package:ejara_test/services/service_locator.dart';

enum EnvironmentType { debug, staging, prod }

class Environment {
  static EnvironmentConfig get current =>
      serviceLocator.get<EnvironmentConfig>();

  static EnvironmentConfig init({required EnvironmentType type}) {
    var config = EnvironmentConfig(
      type: type, baseUrl: "https://testbox-nellys-coin.ejaraapis.xyz/api/v1",);

    switch (type) {
      case EnvironmentType.debug:
      case EnvironmentType.staging:
        return config;
      case EnvironmentType.prod:
        config = EnvironmentConfig(type: type, baseUrl: "//prod-url");
        return config;
    }
  }
}

class EnvironmentConfig {
  EnvironmentType type;
  String baseUrl;

  EnvironmentConfig({
    required this.type,
    required this.baseUrl,
  });
}
