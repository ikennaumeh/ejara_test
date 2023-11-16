import 'package:ejara_test/app.dart';
import 'package:ejara_test/services/service_locator.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(EjaraApp());
}



