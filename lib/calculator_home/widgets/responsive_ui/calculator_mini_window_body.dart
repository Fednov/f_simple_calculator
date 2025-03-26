import 'package:flutter/material.dart';

import '../widgets.dart';

class CalculatorMiniWindowBody extends StatelessWidget {
  const CalculatorMiniWindowBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Flexible(
            flex: 1,
            child: Stack(children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: ShowOperationHistoryButton(),
              ),
              CurrentOperationDisplay()
            ]),
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
