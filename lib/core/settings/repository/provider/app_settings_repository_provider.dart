import 'package:f_simple_calculator/core/service/data_storage/provider/shared_preferences_app_data_storage_provider.dart';
import 'package:f_simple_calculator/core/settings/repository/app_settings_repository.dart';
import 'package:f_simple_calculator/core/settings/repository/app_settings_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appSettingsRepositoryProvider = Provider<AppSettingsRepository>((ref) {
  final sharedPreferencesAppDataStorage =
      ref.watch(sharedPreferencesAppDataStorageProvider);

 return AppSettingsRepositoryImpl(
      sharedPreferencesAppDataStorage: sharedPreferencesAppDataStorage);
});
