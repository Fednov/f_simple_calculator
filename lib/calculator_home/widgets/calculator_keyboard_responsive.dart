import 'package:f_simple_calculator/core/utils/constants/numbers.dart';
import 'package:f_simple_calculator/core/utils/constants/widget_keys.dart';
import 'package:f_simple_calculator/core/utils/math_operation/math_operation.dart';
import 'package:flutter/material.dart';

import 'widgets.dart';

class CalculatorKeyboardResponsive extends StatelessWidget {
  const CalculatorKeyboardResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    var crossAxisCount = 4;

    return LayoutBuilder(
      builder: (context, constraints) {
        var maxHeight = constraints.maxHeight;

        return GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 1.25,
            mainAxisExtent:
                maxHeight / (children.length / crossAxisCount).ceil(),
          ),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          reverse: true,
          children: children,
        );
      },
    );
  }

  final children = const [
    IsNegativeNumberButton(),
    NumberButton(
      number: kNumber0,
      key: ValueKey('$kNumberButtonKey$kNumber0'),
    ),
    CommaButton(),
    EqualsButton(),
    NumberButton(
      number: kNumber1,
      key: ValueKey('$kNumberButtonKey$kNumber1'),
    ),
    NumberButton(
      number: kNumber2,
      key: ValueKey('$kNumberButtonKey$kNumber2'),
    ),
    NumberButton(
      number: kNumber3,
      key: ValueKey('$kNumberButtonKey$kNumber3'),
    ),
    MathOperationButton(
      mathOperation: Addition(),
      key: ValueKey('$kMathOperationButtonKey$kAdditionKey'),
    ),
    NumberButton(
      number: kNumber4,
      key: ValueKey('$kNumberButtonKey$kNumber4'),
    ),
    NumberButton(
      number: kNumber5,
      key: ValueKey('$kNumberButtonKey$kNumber5'),
    ),
    NumberButton(
      number: kNumber6,
      key: ValueKey('$kNumberButtonKey$kNumber6'),
    ),
    MathOperationButton(
      mathOperation: Subtraction(),
      key: ValueKey('$kMathOperationButtonKey$kSubtractionKey'),
    ),
    NumberButton(
      number: kNumber7,
      key: ValueKey('$kNumberButtonKey$kNumber7'),
    ),
    NumberButton(
      number: kNumber8,
      key: ValueKey('$kNumberButtonKey$kNumber8'),
    ),
    NumberButton(
      number: kNumber9,
      key: ValueKey('$kNumberButtonKey$kNumber9'),
    ),
    MathOperationButton(
      mathOperation: Multiplication(),
      key: ValueKey('$kMathOperationButtonKey$kMultiplicationKey'),
    ),
    PercentCalculateButton(),
    ClearCalculatorButton(),
    BackspaceButton(),
    MathOperationButton(
      mathOperation: Division(),
      key: ValueKey('$kMathOperationButtonKey$kDivisionKey'),
    ),
  ];
}
