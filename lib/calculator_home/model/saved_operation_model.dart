import 'dart:convert';

import 'package:f_simple_calculator/core/utils/constants/math_operation_title.dart';
import 'package:f_simple_calculator/core/utils/math_operation/math_operation.dart';

class SavedOperationModel {
  String firstOperand;
  String secondOperand;
  String result;
  MathOperation mathOperation;
  SavedOperationModel({
    required this.firstOperand,
    required this.secondOperand,
    required this.result,
    required this.mathOperation,
  });

  Map<String, dynamic> toMap() {
    return {
      'firstOperand': firstOperand,
      'secondOperand': secondOperand,
      'result': result,
      'mathOperation': mathOperation.title,
    };
  }

  factory SavedOperationModel.fromMap(Map<String, dynamic> map) {
    return SavedOperationModel(
      firstOperand: map['firstOperand'] ?? '',
      secondOperand: map['secondOperand'] ?? '',
      result: map['result'] ?? '',
      mathOperation:
          _mathOperationfromTitle(mathOperationTitle: map['mathOperation']),
    );
  }

  String toJson() => json.encode(toMap());

  factory SavedOperationModel.fromJson(String source) =>
      SavedOperationModel.fromMap(json.decode(source));

  static MathOperation _mathOperationfromTitle(
      {required String mathOperationTitle}) {
    switch (mathOperationTitle) {
      case kAdditionTitle:
        return const Addition();
      case kSubtractionTitle:
        return const Subtraction();
      case kMultiplicationTitle:
        return const Multiplication();
      case kDivisionTitle:
        return const Division();

      default:
        return const Addition();
    }
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SavedOperationModel &&
        other.firstOperand == firstOperand &&
        other.secondOperand == secondOperand &&
        other.result == result &&
        other.mathOperation == mathOperation;
  }

  @override
  int get hashCode {
    return firstOperand.hashCode ^
        secondOperand.hashCode ^
        result.hashCode ^
        mathOperation.hashCode;
  }

  @override
  String toString() {
    return 'SavedResultModel(firstOperand: $firstOperand, secondOperand: $secondOperand, result: $result, mathOperation: $mathOperation)';
  }
}
