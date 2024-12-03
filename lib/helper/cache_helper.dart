import 'package:shared_preferences/shared_preferences.dart';


class CacheHelper {
  static SharedPreferences? preferences;

  static init() async {
    preferences = await SharedPreferences.getInstance();
  }

  static dynamic getData({required String key}) {
    return preferences!.get(key);
  }
  static Future<bool> setData({
    required String key,
    required dynamic value,
  }) async {
    if (value == null) {
      return Future.value(false);
    }
    if (value is String) return await preferences!.setString(key, value);
    if (value is List<String>) return await preferences!.setStringList(key, value);
    if (value is int) return await preferences!.setInt(key, value);
    if (value is bool) return await preferences!.setBool(key, value);
    if (value is double) return await preferences!.setDouble(key, value);
    throw Exception("Invalid data type");
  }

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value == null) {
      return Future.value(false);
    }
    if (value is String) return await preferences!.setString(key, value);
    if (value is List<String>) return await preferences!.setStringList(key, value);
    if (value is int) return await preferences!.setInt(key, value);
    if (value is bool) return await preferences!.setBool(key, value);
    if (value is double) return await preferences!.setDouble(key, value);
    throw Exception("Invalid data type");
  }

  static Future<bool> clearData() {
    return preferences!.clear();
  }

  static Future<bool> removeData({required String key}) {
    return preferences!.remove(key);
  }
}