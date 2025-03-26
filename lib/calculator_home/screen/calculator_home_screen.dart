import 'package:f_simple_calculator/core/utils/constants/dimensons.dart';
import 'package:f_simple_calculator/core/widgets/responsive_layout.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class CalculatorHomeScreen extends StatelessWidget {
  const CalculatorHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClearOperationHistoryButton(),
            IsOperationSavingEnabledButton(),
            ChangeThemeModeButton()
          ],
        ),
      ),
      drawer: const CalculatorScreenDrawer(),
      body: const KeyboardInputHandler(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: kSmallHorizontalPadding,
          ),
          child: ResponsiveLayout(
            mobile: CalculatorMobileBody(),
            miniWindow: CalculatorMiniWindowBody(),
            desktop: CalculatorDesktopBody(),
          ),
        ),
      ),
    );
  }
}
