import 'package:f_simple_calculator/core/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../view_model/provider/calculator_screen_view_model_provider.dart';

class CurrentOperandsDisplay extends ConsumerWidget {
  const CurrentOperandsDisplay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var textStyle = Theme.of(context).textTheme.titleLarge;
    var firstOperand = ref.watch(calculatorScreenViewModelProvider
        .select((value) => value.firstOperand));
    var secondOperand = ref.watch(calculatorScreenViewModelProvider
        .select((value) => value.secondOperand));
    var mathOperation = ref.watch(calculatorScreenViewModelProvider
        .select((value) => value.mathOperation));
    var result = ref.watch(
        calculatorScreenViewModelProvider.select((value) => value.result));

    return mathOperation == null
        ? const SizedBox.shrink()
        : FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              '$firstOperand ${mathOperation.title} ${result != null ? secondOperand : ''} '
                  .convertDotToComma(),
              style: textStyle,
            ),
          );
  }
}
