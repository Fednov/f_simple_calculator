import 'package:f_simple_calculator/core/utils/math_operation/math_operation.dart';
import 'package:f_simple_calculator/core/widgets/base_calculator_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../view_model/provider/calculator_screen_view_model_provider.dart';

class MathOperationButton extends ConsumerWidget {
  const MathOperationButton({
    super.key,
    required this.mathOperation,
  });

  final MathOperation mathOperation;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var theme = Theme.of(context);

    return BaseCalculatorButton(
      color: theme.primaryColor.withOpacity(0.1),
      title: mathOperation.title.toString(),
      onTap: () => ref
          .read(calculatorScreenViewModelProvider.notifier)
          .onOperatorButtonPressed(mathOperation: mathOperation),
    );
  }
}
