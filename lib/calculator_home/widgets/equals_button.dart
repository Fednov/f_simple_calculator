import 'package:f_simple_calculator/core/utils/constants/widget_keys.dart';
import 'package:f_simple_calculator/core/widgets/base_calculator_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../view_model/provider/calculator_screen_view_model_provider.dart';

class EqualsButton extends ConsumerWidget {
  const EqualsButton() : super(key: const ValueKey(kEqualsButtonKey));

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var theme = Theme.of(context);

    return BaseCalculatorButton(
      title: '=',
      color: theme.primaryColor,
      onTap: ref
          .read(calculatorScreenViewModelProvider.notifier)
          .onEqualsButtonPressed,
    );
  }
}
