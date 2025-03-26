import 'package:f_simple_calculator/core/utils/system_functions/app_system_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/app/calculator_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppSystemFunctions.setAppPrefferedOrientations();
  await AppSystemFunctions.setMinimumWindowSize();
  runApp(
    const ProviderScope(
      child: CalculatorApp(),
    ),
  );
}
