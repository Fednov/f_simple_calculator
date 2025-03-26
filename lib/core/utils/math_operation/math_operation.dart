import 'package:f_simple_calculator/core/utils/constants/math_operation_title.dart';

abstract class MathOperation {
  final String title;

  num call({required num firstOperand, required num secondOperand});

  const MathOperation({
    required this.title,
  });
}

class Addition extends MathOperation {
  const Addition({super.title = kAdditionTitle});

  @override
  num call({required num firstOperand, required num secondOperand}) =>
      firstOperand + secondOperand;
}

class Subtraction extends MathOperation {
  const Subtraction({super.title = kSubtractionTitle});

  @override
  num call({required num firstOperand, required num secondOperand}) =>
      firstOperand - secondOperand;
}

class Multiplication extends MathOperation {
  const Multiplication({super.title = kMultiplicationTitle});

  @override
  num call({required num firstOperand, required num secondOperand}) =>
      firstOperand * secondOperand;
}

class Division extends MathOperation {
  const Division({super.title = kDivisionTitle});

  @override
  num call({required num firstOperand, required num secondOperand}) =>
      firstOperand / secondOperand;
}
