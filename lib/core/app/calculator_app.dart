import 'package:f_simple_calculator/calculator_home/screen/calculator_home_screen.dart';
import 'package:f_simple_calculator/core/settings/settings.dart';
import 'package:f_simple_calculator/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:f_simple_calculator/core/extensions/bool_extension.dart';

class CalculatorApp extends ConsumerWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var isDarkMode = ref.watch(appSettingsViewModelProvider
        .select((appThemeModel) => appThemeModel.isDarkMode));

    return MaterialApp(
      title: 'Калькулятор Феднов',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(),
      darkTheme: AppTheme.dakrTheme(),
      themeMode: isDarkMode.themeModeFromIsDarkModeBool(),
      home: const CalculatorHomeScreen(),
    );
  }
}
