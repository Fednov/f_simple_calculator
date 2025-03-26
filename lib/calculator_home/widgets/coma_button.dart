import 'package:f_simple_calculator/core/utils/constants/widget_keys.dart';
import 'package:f_simple_calculator/core/widgets/base_calculator_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../view_model/provider/calculator_screen_view_model_provider.dart';

class CommaButton extends ConsumerWidget {
  const CommaButton() : super(key: const ValueKey(kCommaButtonKey));

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BaseCalculatorButton(
      title: ',',
      onTap: ref
          .read(calculatorScreenViewModelProvider.notifier)
          .onCommaButtonPressed,
    );
  }
}
