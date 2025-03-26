import 'package:flutter/material.dart';

import '../widgets.dart';

class CalculatorMobileBody extends StatelessWidget {
  const CalculatorMobileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Flexible(
              flex: 1,
              child: OperationHistoryDisplay(
                alignment: Alignment.bottomRight,
              )),
          Flexible(
            flex: 1,
            child: CurrentOperationDisplay(),
          ),
          Flexible(
            flex: 3,
            child: CalculatorKeyboardResponsive(),
          ),
        ],
      ),
    );
  }
}
