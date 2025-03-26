import 'package:f_simple_calculator/core/utils/constants/numbers.dart';
import 'package:f_simple_calculator/core/utils/math_operation/math_operation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../view_model/provider/calculator_screen_view_model_provider.dart';

//The class handles user input from the keyboard

class KeyboardInputHandler extends ConsumerWidget {
  const KeyboardInputHandler({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var calculatorScreenViewModel =
        ref.read(calculatorScreenViewModelProvider.notifier);

    return Shortcuts(
      shortcuts: {
        LogicalKeySet(LogicalKeyboardKey.digit1): Number1Pressed(),
        LogicalKeySet(LogicalKeyboardKey.numpad1): Number1Pressed(),
        LogicalKeySet(LogicalKeyboardKey.digit2): Number2Pressed(),
        LogicalKeySet(LogicalKeyboardKey.numpad2): Number2Pressed(),
        LogicalKeySet(LogicalKeyboardKey.digit3): Number3Pressed(),
        LogicalKeySet(LogicalKeyboardKey.numpad3): Number3Pressed(),
        LogicalKeySet(LogicalKeyboardKey.digit4): Number4Pressed(),
        LogicalKeySet(LogicalKeyboardKey.numpad4): Number4Pressed(),
        LogicalKeySet(LogicalKeyboardKey.digit5): Number5Pressed(),
        LogicalKeySet(LogicalKeyboardKey.numpad5): Number5Pressed(),
        LogicalKeySet(LogicalKeyboardKey.digit6): Number6Pressed(),
        LogicalKeySet(LogicalKeyboardKey.numpad6): Number6Pressed(),
        LogicalKeySet(LogicalKeyboardKey.digit7): Number7Pressed(),
        LogicalKeySet(LogicalKeyboardKey.numpad7): Number7Pressed(),
        LogicalKeySet(LogicalKeyboardKey.digit8): Number8Pressed(),
        LogicalKeySet(LogicalKeyboardKey.numpad8): Number8Pressed(),
        LogicalKeySet(LogicalKeyboardKey.digit9): Number9Pressed(),
        LogicalKeySet(LogicalKeyboardKey.numpad9): Number9Pressed(),
        LogicalKeySet(LogicalKeyboardKey.digit0): Number0Pressed(),
        LogicalKeySet(LogicalKeyboardKey.numpad0): Number0Pressed(),
        LogicalKeySet(LogicalKeyboardKey.delete): CommaKeyPressed(),
        LogicalKeySet(LogicalKeyboardKey.numpadComma): CommaKeyPressed(),
        LogicalKeySet(LogicalKeyboardKey.numpadDecimal): CommaKeyPressed(),
        LogicalKeySet(LogicalKeyboardKey.backspace): BackSpaceKeyPressed(),
        LogicalKeySet(LogicalKeyboardKey.add): PlusKeyPressed(),
        LogicalKeySet(LogicalKeyboardKey.numpadAdd): PlusKeyPressed(),
        LogicalKeySet(LogicalKeyboardKey.minus): MinusKeyPressed(),
        LogicalKeySet(LogicalKeyboardKey.numpadSubtract): MinusKeyPressed(),
        LogicalKeySet(LogicalKeyboardKey.numpadMultiply): MultiplyKeyPressed(),
        LogicalKeySet(LogicalKeyboardKey.numpadDivide): DivideKeyPressed(),
        LogicalKeySet(LogicalKeyboardKey.enter): EqualKeyPressed(),
        LogicalKeySet(LogicalKeyboardKey.numpadEqual): EqualKeyPressed(),
        LogicalKeySet(LogicalKeyboardKey.escape): ClearCalculatorKeyPressed(),
      },
      child: Actions(
        actions: {
          Number1Pressed: CallbackAction<Number1Pressed>(
            onInvoke: (intent) => calculatorScreenViewModel
                .onNumberButtonPressed(number: kNumber1),
          ),
          Number2Pressed: CallbackAction(
            onInvoke: (intent) => calculatorScreenViewModel
                .onNumberButtonPressed(number: kNumber2),
          ),
          Number3Pressed: CallbackAction(
            onInvoke: (intent) => calculatorScreenViewModel
                .onNumberButtonPressed(number: kNumber3),
          ),
          Number4Pressed: CallbackAction(
            onInvoke: (intent) => calculatorScreenViewModel
                .onNumberButtonPressed(number: kNumber4),
          ),
          Number5Pressed: CallbackAction(
            onInvoke: (intent) => calculatorScreenViewModel
                .onNumberButtonPressed(number: kNumber5),
          ),
          Number6Pressed: CallbackAction(
            onInvoke: (intent) => calculatorScreenViewModel
                .onNumberButtonPressed(number: kNumber6),
          ),
          Number7Pressed: CallbackAction(
            onInvoke: (intent) => calculatorScreenViewModel
                .onNumberButtonPressed(number: kNumber7),
          ),
          Number8Pressed: CallbackAction(
            onInvoke: (intent) => calculatorScreenViewModel
                .onNumberButtonPressed(number: kNumber8),
          ),
          Number9Pressed: CallbackAction(
            onInvoke: (intent) => calculatorScreenViewModel
                .onNumberButtonPressed(number: kNumber9),
          ),
          Number0Pressed: CallbackAction(
            onInvoke: (intent) => calculatorScreenViewModel
                .onNumberButtonPressed(number: kNumber0),
          ),
          CommaKeyPressed: CallbackAction(
            onInvoke: (intent) =>
                calculatorScreenViewModel.onCommaButtonPressed(),
          ),
          BackSpaceKeyPressed: CallbackAction(
            onInvoke: (intent) =>
                calculatorScreenViewModel.onBackspaceButtonPressed(),
          ),
          PlusKeyPressed: CallbackAction(
            onInvoke: (intent) => calculatorScreenViewModel
                .onOperatorButtonPressed(mathOperation: const Addition()),
          ),
          MinusKeyPressed: CallbackAction(
            onInvoke: (intent) => calculatorScreenViewModel
                .onOperatorButtonPressed(mathOperation: const Subtraction()),
          ),
          MultiplyKeyPressed: CallbackAction(
            onInvoke: (intent) => calculatorScreenViewModel
                .onOperatorButtonPressed(mathOperation: const Multiplication()),
          ),
          DivideKeyPressed: CallbackAction(
            onInvoke: (intent) => calculatorScreenViewModel
                .onOperatorButtonPressed(mathOperation: const Division()),
          ),
          EqualKeyPressed: CallbackAction(
            onInvoke: (intent) =>
                calculatorScreenViewModel.onEqualsButtonPressed(),
          ),
          ClearCalculatorKeyPressed: CallbackAction(
            onInvoke: (intent) =>
                calculatorScreenViewModel.onClearCalculatorButtonPressed(),
          ),
        },
        child: Focus(
          autofocus: true,
          child: Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.transparent,
              child: child),
        ),
      ),
    );
  }
}

class Number1Pressed extends Intent {}

class Number2Pressed extends Intent {}

class Number3Pressed extends Intent {}

class Number4Pressed extends Intent {}

class Number5Pressed extends Intent {}

class Number6Pressed extends Intent {}

class Number7Pressed extends Intent {}

class Number8Pressed extends Intent {}

class Number9Pressed extends Intent {}

class Number0Pressed extends Intent {}

class CommaKeyPressed extends Intent {}

class BackSpaceKeyPressed extends Intent {}

class MinusKeyPressed extends Intent {}

class PlusKeyPressed extends Intent {}

class MultiplyKeyPressed extends Intent {}

class DivideKeyPressed extends Intent {}

class EqualKeyPressed extends Intent {}

class ClearCalculatorKeyPressed extends Intent {}
