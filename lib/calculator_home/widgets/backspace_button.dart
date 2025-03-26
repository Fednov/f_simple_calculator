import 'package:f_simple_calculator/core/utils/constants/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../view_model/provider/calculator_screen_view_model_provider.dart';
import 'widgets.dart';

class BackspaceButton extends ConsumerWidget {
  const BackspaceButton() : super(key: const ValueKey(kBackspaceButtonKey));

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ServiceButton(
      title: '⌫',
      onTap: () => ref
          .read(calculatorScreenViewModelProvider.notifier)
          .onBackspaceButtonPressed(),
    );
  }
}
