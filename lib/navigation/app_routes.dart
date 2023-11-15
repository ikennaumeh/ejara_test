import 'dart:io';
import 'package:ejara_test/ui/views/choose_payment_method/choose_payment_method_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String choosePaymentMethod = "/choosePaymentMethod";

  static Route getRoute(RouteSettings settings) {
    switch (settings.name) {
      case choosePaymentMethod:
      default:
        return _build(settings, const ChoosePaymentMethodView());
    }
  }

  static Route _build(
    RouteSettings settings,
    Widget screen, {
    bool isFullScreen = false,
  }) {
    if (Platform.isIOS) {
      return CupertinoPageRoute(
        settings: settings,
        builder: (context) => screen,
        fullscreenDialog: isFullScreen,
      );
    }
    return MaterialPageRoute(
      settings: settings,
      builder: (context) => screen,
      fullscreenDialog: isFullScreen,
    );
  }
}
