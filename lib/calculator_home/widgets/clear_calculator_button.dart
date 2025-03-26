import 'package:f_simple_calculator/calculator_home/widgets/service_button.dart';
import 'package:f_simple_calculator/core/utils/constants/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../view_model/provider/calculator_screen_view_model_provider.dart';

class ClearCalculatorButton extends ConsumerWidget {
  const ClearCalculatorButton()
      : super(key: const ValueKey(kClearCalculatorButtonKey));

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ServiceButton(
      title: 'C',
      onTap: ref
          .read(calculatorScreenViewModelProvider.notifier)
          .onClearCalculatorButtonPressed,
    );
  }
}
