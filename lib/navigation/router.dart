import 'package:ejara_test/navigation/navigator_key.dart';
import 'package:flutter/widgets.dart';

class AppRouter {
  late NavigatorState _navigatorState;

  set navigator(NavigatorState value) {
    _navigatorState = value;
  }

  NavigatorState get navigatorState => _navigatorState;

  bool canPop() {
    return navigatorState.canPop();
  }

  void pop<T extends Object?>([T? result]) {
    navigatorState.pop<T>(result);
  }

  Future<T?> pushNamed<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) {
    return navigatorState.pushNamed<T>(
      routeName,
      arguments: arguments,
    );
  }

}

class AppLevelRouter extends AppRouter {
  AppLevelRouter();

  @override
  NavigatorState get navigatorState =>
      NavigatorKey.appNavigatorKey.currentState!;
}