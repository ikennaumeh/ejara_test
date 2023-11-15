import 'package:ejara_test/navigation/router.dart';
import 'package:ejara_test/services/service_locator.dart';
import 'package:ejara_test/ui/base/busy_or_error_state_helpers.dart';
import 'package:flutter/widgets.dart';

class BaseViewModel extends ChangeNotifier with BusyOrErrorStateHelpers {
  late AppRouter _router;

  BaseViewModel() {
    _router = serviceLocator.get<AppLevelRouter>();
  }

  // This helps to dispose of the ViewModel when its View is no more in the navigation stack
  bool _disposed = false;

  /// This helps us to route within our ViewModel with ease
  AppRouter get router => _router;

  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }
}
