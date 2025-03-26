import 'package:f_simple_calculator/core/utils/math_operation/math_operation.dart';
import 'package:f_simple_calculator/core/utils/constants/numbers.dart';
import 'package:flutter/foundation.dart';

import 'saved_operation_model.dart';

class CalculatorModel {
  final String firstOperand;
  final String? secondOperand;
  final String? result;
  final MathOperation? mathOperation;
  final List<SavedOperationModel> history;
  final bool isOperationSavingEnabled;

  CalculatorModel({
    this.firstOperand = kNumber0,
    this.secondOperand,
    this.result,
    this.mathOperation,
    this.history = const [],
    this.isOperationSavingEnabled = true,
  });

  CalculatorModel copyWith({
    String? firstOperand,
    String? secondOperand,
    String? result,
    MathOperation? mathOperation,
    List<SavedOperationModel>? history,
    bool? isOperationSavingEnabled,
  }) {
    return CalculatorModel(
      firstOperand: firstOperand ?? this.firstOperand,
      secondOperand: secondOperand ?? this.secondOperand,
      result: result ?? this.result,
      mathOperation: mathOperation ?? this.mathOperation,
      history: history ?? this.history,
      isOperationSavingEnabled:
          isOperationSavingEnabled ?? this.isOperationSavingEnabled,
    );
  }

  CalculatorModel clearModel() {
    return CalculatorModel(
      firstOperand: '0',
      secondOperand: null,
      result: null,
      mathOperation: null,
      history: history,
      isOperationSavingEnabled: isOperationSavingEnabled,
    );
  }

  CalculatorModel nextOperation() {
    return CalculatorModel(
      firstOperand: result ?? '0',
      secondOperand: null,
      result: null,
      mathOperation: null,
      history: history,
      isOperationSavingEnabled: isOperationSavingEnabled,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CalculatorModel &&
        other.firstOperand == firstOperand &&
        other.secondOperand == secondOperand &&
        other.result == result &&
        other.mathOperation == mathOperation &&
        listEquals(other.history, history) &&
        other.isOperationSavingEnabled == isOperationSavingEnabled;
  }

  @override
  int get hashCode {
    return firstOperand.hashCode ^
        secondOperand.hashCode ^
        result.hashCode ^
        mathOperation.hashCode ^
        history.hashCode ^
        isOperationSavingEnabled.hashCode;
  }

  String resultToString() =>
      '$firstOperand ${mathOperation?.title} $secondOperand = $result';

  @override
  String toString() {
    return 'CalculatorScreenModel(firstOperand: $firstOperand, secondOperand: $secondOperand, result: $result, mathOperation: $mathOperation, history: $history, isOperationSavingEnabled: $isOperationSavingEnabled)';
  }
}
