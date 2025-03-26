import 'package:f_simple_calculator/core/extensions/string_extension.dart';
import 'package:f_simple_calculator/core/utils/constants/numbers.dart';
import 'package:f_simple_calculator/core/utils/math_operation/math_operation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/calculator_model.dart';
import '../model/saved_operation_model.dart';
import '../repository/calculator_repository.dart';

class CalculatorViewModel extends StateNotifier<CalculatorModel> {
  CalculatorViewModel({required this.calculatorRepository})
      : super(CalculatorModel()) {
    _loadOperationHistory();
  }

  final CalculatorRepository calculatorRepository;

  String get _firstOperand => state.firstOperand;
  String? get _secondOperand => state.secondOperand;
  String? get _result => state.result;
  MathOperation? get _mathOperation => state.mathOperation;
  List<SavedOperationModel> get _history => state.history;
  bool get _isOperationSavingEnabled => state.isOperationSavingEnabled;
  bool get _isOperatorEntered => state.mathOperation != null;
  bool get _isAllOperandsEntered =>
      state.secondOperand != null && state.mathOperation != null;
  bool get _isOperationDone => _result != null;
  num get _numParsedFirstOperand => num.parse(_firstOperand);
  num? get _numParsedSecondOperand => num.tryParse(_secondOperand ?? '');

  void onNumberButtonPressed({required String number}) {
    if (_isOperationDone) {
      _clearCalculator();
    }

    if (!_isOperatorEntered) {
      state = state.copyWith(
          firstOperand:
              _firstOperand == kNumber0 ? number : '$_firstOperand$number');
    } else {
      if (_secondOperand == kNumber0) {
        state = state.copyWith(secondOperand: number);
        return;
      }

      state = state.copyWith(secondOperand: '${_secondOperand ?? ''}$number');
    }
  }

  void onOperatorButtonPressed({required MathOperation mathOperation}) {
    if (_isOperationDone) {
      _nextOperation();
      state = state.copyWith(mathOperation: mathOperation);
    }

    if (_isAllOperandsEntered) {
      _calculateOperationResult();
      _nextOperation();
      state = state.copyWith(mathOperation: mathOperation);
    }

    if (_firstOperand.endsWith('.')) {
      state = state.copyWith(firstOperand: _firstOperand.deleteLastSymbol());
    }

    state = state.copyWith(mathOperation: mathOperation);
  }

  void onEqualsButtonPressed() {
    _calculateOperationResult();
  }

  void onCommaButtonPressed() {
    if (_isOperationDone) {
      _clearCalculator();
    }

    if (!_isOperatorEntered) {
      if (!_firstOperand.contains(kComma)) {
        state = state.copyWith(firstOperand: '$_firstOperand$kComma');
      }
    } else {
      if (_secondOperand == null) {
        state = state.copyWith(secondOperand: '$kNumber0$kComma');
      } else {
        if (!_secondOperand!.contains(kComma)) {
          state = state.copyWith(secondOperand: '$_secondOperand$kComma');
        }
      }
    }
  }

  void onPercentCalculateButtonPressed() {
    if (_isOperationDone) {
      return;
    }

    if (_isAllOperandsEntered) {
      if (_mathOperation is Addition || _mathOperation is Subtraction) {
        num calculationOfThePercentageRatio =
            (_numParsedFirstOperand / 100) * _numParsedSecondOperand!;
        if (calculationOfThePercentageRatio % 1 == 0) {
          calculationOfThePercentageRatio =
              calculationOfThePercentageRatio.toInt();
        }

        state =
            state.copyWith(secondOperand: '$calculationOfThePercentageRatio');
      }

      if (_mathOperation is Multiplication || _mathOperation is Division) {
        state = state.copyWith(
            secondOperand: _numParsedSecondOperand != null
                ? (_numParsedSecondOperand! / 100).toString()
                : '');
      }
    }
  }

  void onIsNegativeNumberButtonPressed() {
    if (_isOperationDone) {
      _nextOperation();
    }

    if (_secondOperand != null) {
      state = state.copyWith(secondOperand: '${-(_numParsedSecondOperand!)}');
    } else {
      state = state.copyWith(firstOperand: '${-(_numParsedFirstOperand)}');
    }
  }

  void onBackspaceButtonPressed() {
    if (_isOperationDone) {
      return;
    } else if (_secondOperand != null) {
      if (_numParsedSecondOperand!.abs().toString().length > 1) {
        var secondOperand = _secondOperand!.deleteLastSymbol();
        state = state.copyWith(secondOperand: secondOperand);
      } else {
        state = state.copyWith(secondOperand: kNumber0);
      }
    } else if (_mathOperation != null) {
      return;
    } else {
      if (_numParsedFirstOperand.abs().toString().length > 1) {
        var firstOperand = _firstOperand.deleteLastSymbol();
        state = state.copyWith(firstOperand: firstOperand);
      } else {
        state = state.copyWith(firstOperand: kNumber0);
      }
    }
  }

  Future<void> onClearOperationHistoryButtonPressed() async {
    await _clearHistory();
  }

  void onSavedOperationSelect({required SavedOperationModel savedOperation}) {
    state = state.copyWith(
      firstOperand: savedOperation.firstOperand,
      secondOperand: savedOperation.secondOperand,
      result: savedOperation.result,
      mathOperation: savedOperation.mathOperation,
    );
  }

  void isOperationSavingEnabledToggle(
      {required bool isOperationSavingEnabled}) {
    state = state.copyWith(isOperationSavingEnabled: isOperationSavingEnabled);
  }

  void onClearCalculatorButtonPressed() {
    _clearCalculator();
  }

  void _calculateOperationResult() {
    if (_isAllOperandsEntered) {
      if (state.mathOperation is Division && (_numParsedSecondOperand == 0)) {
        _clearCalculator();
        return;
      }
      var result = _mathOperation!(
          firstOperand: _numParsedFirstOperand,
          secondOperand: _numParsedSecondOperand!);
      if (result % 1 == 0) {
        result = result.toInt();
      }

      if (_secondOperand != null && _secondOperand!.endsWith('.')) {
        state =
            state.copyWith(secondOperand: _secondOperand!.deleteLastSymbol());
      }

      state = state.copyWith(result: result.toString());

      if (_isOperationSavingEnabled) {
        _saveOperation();
      }
    }
  }

  Future<void> _saveOperation() async {
    if (_secondOperand != null && _mathOperation != null && _result != null) {
      final savedResult = SavedOperationModel(
        firstOperand: _firstOperand,
        secondOperand: _secondOperand!,
        result: _result!,
        mathOperation: _mathOperation!,
      );

      state = state.copyWith(history: [..._history, savedResult]);
      await calculatorRepository.saveOperationHistory(
          operationHistory: _history);
    }
  }

  Future<void> _clearHistory() async {
    state = state.copyWith(history: []);
    await calculatorRepository.clearOperationHistory();
  }

  Future<void> _loadOperationHistory() async {
    final loadedOperationHistory =
        await calculatorRepository.loadOperationHistory();

    state = state.copyWith(history: loadedOperationHistory);
  }

  void _nextOperation() {
    state = state.nextOperation();
  }

  void _clearCalculator() {
    state = state.clearModel();
  }
}
