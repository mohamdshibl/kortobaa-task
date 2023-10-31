import 'package:shared_preferences/shared_preferences.dart';

class MyCache {
  static SharedPreferences? preferences;


  static Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }


  static Future<bool?> saveData(
      {required String key, required dynamic value})
  async {
    if (value is String) return await preferences?.setString(key, value);
    if (value is int) return await preferences?.setInt(key, value);
    if (value is bool) return await preferences?.setBool(key, value);

    return await preferences?.setDouble(key, value);
  }

  static dynamic getData({required String key}) {
    var data = preferences?.get(key);
    if (data is String) {
      return data;
    } else if (data is int) {
      return data;
    } else if (data is bool) {
      return data;
    } else if (data is double) {
      return data;
    } else {
      // Handle the case when the data is of an unknown type or null.
      return null; // You can choose an appropriate default value or return type here.
    }
  }

}