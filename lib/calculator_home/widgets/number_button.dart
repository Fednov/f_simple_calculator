import 'package:f_simple_calculator/core/widgets/base_calculator_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../view_model/provider/calculator_screen_view_model_provider.dart';

class NumberButton extends ConsumerWidget {
  const NumberButton({
    super.key,
    required this.number,
  });

  final String number;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BaseCalculatorButton(
      title: number.toString(),
      onTap: () => ref
          .read(calculatorScreenViewModelProvider.notifier)
          .onNumberButtonPressed(number: number),
    );
  }
}
