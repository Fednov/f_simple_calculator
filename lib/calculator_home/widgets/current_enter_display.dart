import 'package:f_simple_calculator/core/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../view_model/provider/calculator_screen_view_model_provider.dart';

class CurrentEnterDisplay extends ConsumerWidget {
  const CurrentEnterDisplay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var theme = Theme.of(context);

    var firstOperand = ref.watch(calculatorScreenViewModelProvider
        .select((value) => value.firstOperand));
    var secondOperand = ref.watch(calculatorScreenViewModelProvider
        .select((value) => value.secondOperand));
    var result = ref.watch(
        calculatorScreenViewModelProvider.select((value) => value.result));

    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(
        (result != null ? '= $result' : secondOperand ?? firstOperand)
            .convertDotToComma(),
        style: theme.textTheme.displayLarge,
      ),
    );
  }
}
