import 'package:f_simple_calculator/core/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../view_model/provider/calculator_screen_view_model_provider.dart';

class IsOperationSavingEnabledButton extends ConsumerWidget {
  const IsOperationSavingEnabledButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var isOperationSavingEnabled = ref.watch(calculatorScreenViewModelProvider
        .select((calculatorScreenModelProvider) =>
            calculatorScreenModelProvider.isOperationSavingEnabled));

    return IconButton(
      icon: Icon(isOperationSavingEnabled ? Icons.save : Icons.not_interested),
      tooltip: isOperationSavingEnabled
          ? 'Не сохранять историю'
          : 'Сохранять историю',
      onPressed: ref
          .read(appSettingsViewModelProvider.notifier)
          .isResultSavingEnabledSwitch,
    );
  }
}
