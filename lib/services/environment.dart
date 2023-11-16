import 'package:ejara_test/services/service_locator.dart';

enum EnvironmentType { debug, staging, prod }

class Environment {
  static EnvironmentConfig get current => serviceLocator.get<EnvironmentConfig>();

  static EnvironmentConfig init({required EnvironmentType type}) {
    var config = EnvironmentConfig(
      type: type,
      baseUrlV1: "https://testbox-nellys-coin.ejaraapis.xyz/api/v1",
      baseUrlV2: "https://testbox-nellys-coin.ejaraapis.xyz/api/v2"
    );

    switch (type) {
      case EnvironmentType.debug:
      case EnvironmentType.staging:
        return config;
      case EnvironmentType.prod:
        config = EnvironmentConfig(type: type, baseUrlV1: "//prod-url", baseUrlV2: "//");
        return config;
    }
  }
}

class EnvironmentConfig {
  EnvironmentType type;
  String baseUrlV1;
  String baseUrlV2;

  EnvironmentConfig({
    required this.type,
    required this.baseUrlV1,
    required this.baseUrlV2,
  });
}
