import 'dart:developer';

import 'package:f_simple_calculator/core/service/data_storage/shared_preferences_app_data_storage.dart';
import 'package:f_simple_calculator/core/settings/model/app_settings_model.dart';
import 'package:f_simple_calculator/core/settings/repository/app_settings_repository.dart';

const kAppSettingsPrefsKey = 'app_settings_prefs_key';

class AppSettingsRepositoryImpl extends AppSettingsRepository {
  final SharedPreferencesAppDataStorage sharedPreferencesAppDataStorage;
  AppSettingsRepositoryImpl({
    required this.sharedPreferencesAppDataStorage,
  });

  @override
  Future<AppSettingsModel?> loadSavedAppSettings() async {
    try {
      var savedAppSettingsModelString = await sharedPreferencesAppDataStorage
          .getString(key: kAppSettingsPrefsKey);

      return savedAppSettingsModelString != null
          ? AppSettingsModel.fromJson(savedAppSettingsModelString)
          : null;
    } catch (e) {
      log(e.toString());
      throw Exception(e);
    }
  }

  @override
  Future<bool> saveAppSettings(
      {required AppSettingsModel appSettingsModel}) async {
    try {
      return sharedPreferencesAppDataStorage.saveString(
          key: kAppSettingsPrefsKey, data: appSettingsModel.toJson());
    } catch (e) {
      log(e.toString());
      throw Exception(e);
    }
  }
}
