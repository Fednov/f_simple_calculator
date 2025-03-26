import 'package:flutter/material.dart';

import '../widgets.dart';

class CalculatorDesktopBody extends StatelessWidget {
  const CalculatorDesktopBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
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
          ),
          SizedBox(
            width: 250,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: OperationHistoryDisplay(
                    alignment: Alignment.topCenter,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
