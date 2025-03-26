import 'package:f_simple_calculator/core/service/data_storage/provider/shared_preferences_app_data_storage_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../calculator_repository.dart';
import '../calculator_repository_impl.dart';

final calculatorRepositoryProvider = Provider<CalculatorRepository>((ref) {
  final sharedPreferencesAppDataStorage =
      ref.watch(sharedPreferencesAppDataStorageProvider);

  return CalculatorRepositoryImpl(
      sharedPreferencesAppDataStorage: sharedPreferencesAppDataStorage);
});
