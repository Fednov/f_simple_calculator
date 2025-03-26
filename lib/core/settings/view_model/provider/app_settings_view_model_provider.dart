import 'package:f_simple_calculator/core/settings/model/app_settings_model.dart';
import 'package:f_simple_calculator/core/settings/repository/provider/app_settings_repository_provider.dart';
import 'package:f_simple_calculator/core/settings/view_model/app_settings_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appSettingsViewModelProvider =
    StateNotifierProvider<AppSettingsViewModel, AppSettingsModel>((ref) {
  final appSettingsRepository = ref.watch(appSettingsRepositoryProvider);

  return AppSettingsViewModel(appSettingsRepository: appSettingsRepository);
});
