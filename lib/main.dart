import 'package:f_simple_calculator/core/app/calculator_app.dart';
import 'package:f_simple_calculator/core/utils/system_functions/app_system_functions.dart';
import 'package:f_simple_calculator/core/widgets/adaptive_status_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppSystemFunctions.setPrefferedOrientations();
  await AppSystemFunctions.setMinimumWindowSize();
  runApp(
    const ProviderScope(
      child: AdaptiveStatusBar(
        child: CalculatorApp(),
      ),
    ),
  );
}
