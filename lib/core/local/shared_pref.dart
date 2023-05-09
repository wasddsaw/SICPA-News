import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  SharedPreferences? sharedPreferences;

  static const String keyAccessToken = 'accessToken';
  static const String keyUserData = 'user_data';
  static const String keyRole = 'user_role';
  static const String keyFcmToken = 'fcm_token';
  static const String keyUserCurrentPosition = 'user_current_position';

  SharedPreferencesManager({required this.sharedPreferences});

  Future<bool>? putBool(String key, bool value) =>
      sharedPreferences?.setBool(key, value);

  bool? getBool(String key) => sharedPreferences?.getBool(key);

  Future<bool>? putDouble(String key, double value) =>
      sharedPreferences?.setDouble(key, value);

  double? getDouble(String key) => sharedPreferences?.getDouble(key);

  Future<bool>? putInt(String key, int value) =>
      sharedPreferences?.setInt(key, value);

  int? getInt(String key) => sharedPreferences?.getInt(key);

  Future<bool>? putString(String key, String value) =>
      sharedPreferences?.setString(key, value);

  String? getString(String key) => sharedPreferences?.getString(key);

  Future<bool>? putStringList(String key, List<String> value) =>
      sharedPreferences?.setStringList(key, value);

  List<String>? getStringList(String key) =>
      sharedPreferences?.getStringList(key);

  bool? isKeyExists(String key) => sharedPreferences?.containsKey(key);

  Future<bool>? clearKey(String key) => sharedPreferences?.remove(key);

  Future<bool>? clearAll() => sharedPreferences?.clear();
}
