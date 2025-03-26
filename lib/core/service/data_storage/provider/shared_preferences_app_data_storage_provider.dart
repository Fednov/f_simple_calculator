import 'package:f_simple_calculator/core/service/data_storage/shared_preferences_app_data_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sharedPreferencesAppDataStorageProvider =
    Provider((ref) => SharedPreferencesAppDataStorage());
