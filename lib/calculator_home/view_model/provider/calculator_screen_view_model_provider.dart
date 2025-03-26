import 'package:f_simple_calculator/calculator_home/model/calculator_model.dart';
import 'package:f_simple_calculator/calculator_home/repository/calculator_repository.dart';
import 'package:f_simple_calculator/calculator_home/repository/provider/calculator_repository_provider.dart';
import 'package:f_simple_calculator/calculator_home/view_model/calculator_view_model.dart';
import 'package:f_simple_calculator/core/settings/settings.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final calculatorScreenViewModelProvider =
    StateNotifierProvider<CalculatorViewModel, CalculatorModel>(
  (ref) {
    final CalculatorRepository calculatorScreenRepository =
        ref.watch(calculatorRepositoryProvider);

    final CalculatorViewModel calculatorScreenViewModel =
        CalculatorViewModel(calculatorRepository: calculatorScreenRepository);

    ref.listen(
        appSettingsViewModelProvider.select(
            (appSettingsModel) => appSettingsModel.isOperationSavingEnabled),
        (previos, next) => calculatorScreenViewModel
            .isOperationSavingEnabledToggle(isOperationSavingEnabled: next),
        fireImmediately: true);

    return calculatorScreenViewModel;
  },
);
