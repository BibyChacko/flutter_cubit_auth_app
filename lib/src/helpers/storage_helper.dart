import 'package:shared_preferences/shared_preferences.dart';

class StorageHelper {
  static writeData(String key, String value) async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    sh.setString(key, value);
  }

  static Future<String?> readData(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? data = sharedPreferences.getString(key);
    return data;
  }
}
