import '../model/saved_operation_model.dart';

abstract class CalculatorRepository {
  Future<List<SavedOperationModel>?> loadOperationHistory();
  Future<bool> saveOperationHistory(
      {required List<SavedOperationModel> operationHistory});
  Future<bool> clearOperationHistory();
}
