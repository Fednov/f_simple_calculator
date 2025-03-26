import 'package:f_simple_calculator/core/settings/repository/app_settings_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/app_settings_model.dart';

class AppSettingsViewModel extends StateNotifier<AppSettingsModel> {
  AppSettingsViewModel({required this.appSettingsRepository})
      : super(AppSettingsModel()) {
    _loadSavedAppSettings();
  }

  AppSettingsRepository appSettingsRepository;

  Future<void> themeModeSwitch() async {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
    _saveAppSettings();
  }

  Future<void> isResultSavingEnabledSwitch() async {
    state = state.copyWith(
        isOperationSavingEnabled: !state.isOperationSavingEnabled);
    _saveAppSettings();
  }

  Future<void> _loadSavedAppSettings() async {
    final savedAppSettingsModel =
        await appSettingsRepository.loadSavedAppSettings();

    if (savedAppSettingsModel != null) {
      state = savedAppSettingsModel;
    }
  }

  Future<void> _saveAppSettings() async {
    await appSettingsRepository.saveAppSettings(appSettingsModel: state);
  }
}
