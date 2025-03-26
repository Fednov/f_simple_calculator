import 'package:f_simple_calculator/core/settings/model/app_settings_model.dart';

abstract class AppSettingsRepository {
  Future<AppSettingsModel?> loadSavedAppSettings();
  Future<bool> saveAppSettings({required AppSettingsModel appSettingsModel});
}
