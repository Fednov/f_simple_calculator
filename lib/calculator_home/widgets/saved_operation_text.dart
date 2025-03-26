import 'package:f_simple_calculator/core/extensions/string_extension.dart';
import 'package:f_simple_calculator/core/utils/constants/numbers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/saved_operation_model.dart';
import '../view_model/provider/calculator_screen_view_model_provider.dart';

class SavedOperationText extends ConsumerWidget {
  const SavedOperationText({
    super.key,
    required this.savedOperation,
  });

  final SavedOperationModel savedOperation;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var textStyle = Theme.of(context).textTheme.titleLarge;
    var isDarkMode = Theme.of(context).brightness == Brightness.dark;
    var firstOperand = savedOperation.firstOperand.limitDecimalCharacters();
    var secondOperand = savedOperation.secondOperand.limitDecimalCharacters();
    var result = savedOperation.result.limitDecimalCharacters();
    var mathOperationTitle = savedOperation.mathOperation.title;

    return GestureDetector(
      onTap: () {
        ref
            .read(calculatorScreenViewModelProvider.notifier)
            .onSavedOperationSelect(
              savedOperation: savedOperation,
            );
        Navigator.of(context).maybePop();
      },
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          '$firstOperand $mathOperationTitle $secondOperand $kEqual $result',
          style: textStyle?.copyWith(
            fontStyle: FontStyle.italic,
            color: textStyle.color?.withOpacity(!isDarkMode ? 0.5 : 0.7),
          ),
        ),
      ),
    );
  }
}
