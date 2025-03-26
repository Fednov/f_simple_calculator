import 'dart:math' as math;

import 'package:flutter/material.dart';

class BaseCalculatorButton extends StatelessWidget {
  const BaseCalculatorButton({
    super.key,
    this.color,
    this.textColor,
    required this.title,
    required this.onTap,
  });

  final String title;
  final Color? color;
  final Color? textColor;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var size = MediaQuery.of(context).size;
    var minSize = math.min(size.height, size.width);
    var buttonSize = minSize / 4;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: buttonSize,
        width: buttonSize,
        alignment: Alignment.center,
        margin: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          color: color ?? theme.scaffoldBackgroundColor,
          border: Border.all(
            width: buttonSize / 100 * 0.5,
            color: theme.dividerColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            title,
            style: theme.textTheme.headlineMedium?.copyWith(color: textColor),
          ),
        ),
      ),
    );
  }
}
