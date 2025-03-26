import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../view_model/provider/calculator_screen_view_model_provider.dart';

class ClearOperationHistoryButton extends ConsumerWidget {
  const ClearOperationHistoryButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
        icon: const Icon(Icons.delete),
        tooltip: 'Удалить историю',
        onPressed: ref
            .read(calculatorScreenViewModelProvider.notifier)
            .onClearOperationHistoryButtonPressed);
  }
}
