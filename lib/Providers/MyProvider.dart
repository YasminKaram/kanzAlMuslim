import 'package:flutter/material.dart';
import 'package:islami/prefs_helper.dart';

class MyProvider extends ChangeNotifier {
  String languageCode = "en";
  ThemeMode themeingMode = ThemeMode.light;

  void init() async {
    String? newlang = PrefsHelper.getLanguage();
    changeLanguage(newlang ?? "en");
    String mode = PrefsHelper.getTheme();
    if (mode == "dark") {
      changeThemeing(ThemeMode.dark);
    } else {
      changeThemeing(ThemeMode.light);
    }
  }

  void changeLanguage(String langCode) {
    languageCode = langCode;
    PrefsHelper.setLanguage(langCode);

    notifyListeners();
  }

  void changeThemeing(ThemeMode thememode) {
    themeingMode = thememode;
    if (thememode == ThemeMode.dark) {
      PrefsHelper.setTheme("dark");
    } else {
      PrefsHelper.setTheme("light");
    }
    notifyListeners();
  }
}
