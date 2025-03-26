import 'package:flutter/material.dart';

class AppStyles {
  static const ButtonStyle iconButtonStyle = ButtonStyle(
    textStyle: WidgetStatePropertyAll(
      TextStyle(
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
      ),
    ),
  );

  static const tooltipTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
  );
}
