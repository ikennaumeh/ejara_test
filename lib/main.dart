import 'package:ejara_test/app.dart';
import 'package:ejara_test/services/environment.dart';
import 'package:ejara_test/services/manager/dependency_manager.dart';
import 'package:flutter/material.dart';

void main() {
  var dependencyManager = DependencyManager(type: EnvironmentType.debug);

  runApp(EjaraApp(dependencyManager: dependencyManager,));
}



