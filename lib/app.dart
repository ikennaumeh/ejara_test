import 'dart:math';
import 'package:ejara_test/navigation/app_routes.dart';
import 'package:ejara_test/navigation/navigator_key.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';

class EjaraApp extends StatefulWidget {
  const EjaraApp({super.key});

  @override
  State<EjaraApp> createState() => _EjaraAppState();
}

class _EjaraAppState extends State<EjaraApp> {
  Logger logger = Logger("_EjaraAppState");

  @override
  void initState() {
    _initSystemUI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejara',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xfff9f9fb),
        appBarTheme: const AppBarTheme(elevation: 0, backgroundColor: Colors.transparent),
        inputDecorationTheme: InputDecorationTheme(          
          fillColor: Colors.transparent,
          contentPadding: const EdgeInsets.all(10),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Color(0xffb3b4cd),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Color(0xffb3b4cd),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Color(0xffb3b4cd),
            ),
          ),
        ),
      ),
      builder: (context, child) {
        final mQuery = MediaQuery.of(context);
        return MediaQuery(
          data: mQuery.copyWith(
            textScaleFactor: min(mQuery.textScaleFactor, 1.4),
          ),
          child: child!,
        );
      },
      home: WillPopScope(
        onWillPop: () async {
          bool screenPopped = await NavigatorKey.appNavigatorKey.currentState?.maybePop() ?? false;
          return !screenPopped;
        },
        child: Navigator(
          key: NavigatorKey.appNavigatorKey,
          onGenerateRoute: AppRoutes.getRoute,
        ),
      ),
    );
  }

  void _initSystemUI() {
    // Configure preferred orientation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ));
  }
}
