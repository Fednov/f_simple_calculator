import 'dart:developer';

import 'package:f_simple_calculator/core/service/data_storage/shared_preferences_app_data_storage.dart';

import '../model/saved_operation_model.dart';
import 'calculator_repository.dart';

const kCalculatorScreenPrefsKey = 'calculator_screen_prefs_key';

class CalculatorRepositoryImpl extends CalculatorRepository {
  CalculatorRepositoryImpl({
    required this.sharedPreferencesAppDataStorage,
  });

  final SharedPreferencesAppDataStorage sharedPreferencesAppDataStorage;

  @override
  Future<bool> clearOperationHistory() async {
    try {
      return sharedPreferencesAppDataStorage.deleteData(
          key: kCalculatorScreenPrefsKey);
    } catch (e) {
      log(e.toString());
      throw Exception(e);
    }
  }

  @override
  Future<List<SavedOperationModel>?> loadOperationHistory() async {
    try {
      var jsonOperationHistory = await sharedPreferencesAppDataStorage
          .getStringList(key: kCalculatorScreenPrefsKey);

      return jsonOperationHistory
          ?.map((element) => SavedOperationModel.fromJson(element))
          .toList();
    } catch (e) {
      log(e.toString());
      throw Exception(e);
    }
  }

  @override
  Future<bool> saveOperationHistory(
      {required List<SavedOperationModel> operationHistory}) async {
    try {
      var operationHistoryToJson =
          operationHistory.map((element) => element.toJson()).toList();

      return sharedPreferencesAppDataStorage.saveStringList(
          key: kCalculatorScreenPrefsKey, data: operationHistoryToJson);
    } catch (e) {
      log(e.toString());
      throw Exception(e);
    }
  }
}
