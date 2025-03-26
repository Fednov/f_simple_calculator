import 'package:flutter/material.dart';

extension BoolExtension on bool {
  ThemeMode themeModeFromIsDarkModeBool() {
    switch (this) {
      case true:
        return ThemeMode.dark;
      case false:
        return ThemeMode.light;

      default:
        return ThemeMode.light;
    }
  }
}
