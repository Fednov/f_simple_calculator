import 'package:f_simple_calculator/core/utils/constants/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../view_model/provider/calculator_screen_view_model_provider.dart';
import 'widgets.dart';

class PercentCalculateButton extends ConsumerWidget {
  const PercentCalculateButton()
      : super(key: const ValueKey(kPercentCalculateButtonKey));

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ServiceButton(
      title: '%',
      onTap: ref
          .read(calculatorScreenViewModelProvider.notifier)
          .onPercentCalculateButtonPressed,
    );
  }
}
