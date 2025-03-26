import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesAppDataStorage {
  late SharedPreferences sharedPreferences;

  Future<bool> deleteData({required String key}) async {
    sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.remove(key);
  }

  Future<String?> getString({required String key}) async {
    sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(key);
  }

  Future<List<String>?> getStringList({required String key}) async {
    sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getStringList(key);
  }

  Future<bool> saveString({required String key, required String data}) async {
    sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(key, data);
  }

  Future<bool> saveStringList(
      {required String key, required List<String> data}) async {
    sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setStringList(key, data);
  }
}
