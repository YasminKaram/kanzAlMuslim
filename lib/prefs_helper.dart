import 'package:shared_preferences/shared_preferences.dart';

class PrefsHelper {
  static late SharedPreferences prefs;

  static String? getLanguage() {
    return prefs.getString("lang");
  }

  static setLanguage(String language) async {
    await prefs.setString("lang", language);
  }

  static setTheme(String mode) async {
    await prefs.setString("mode", mode);
  }

  static String getTheme() {
    return prefs.getString("mode") ?? "light";
  }
}
