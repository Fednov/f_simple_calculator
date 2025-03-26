import 'package:f_simple_calculator/core/widgets/base_calculator_button.dart';
import 'package:flutter/material.dart';

class ServiceButton extends StatelessWidget {
  const ServiceButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BaseCalculatorButton(
      title: title,
      textColor: theme.primaryColor,
      onTap: onTap,
    );
  }
}
