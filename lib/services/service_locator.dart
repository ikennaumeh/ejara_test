import 'package:get_it/get_it.dart';
import 'package:logging/logging.dart';


GetIt get serviceLocator => GetIt.instance;

extension ServiceLocator on GetIt {

  Future<void> ensureReady<T extends Object>() async {
    try {
      await isReady<T>();
    } catch (e) {
      // Means the dependency was ready
      Logger("ServiceLocator").info('$T is already initialized');
    }
  }
}