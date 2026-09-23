import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppThemeProviders extends ChangeNotifier {
  ThemeMode appTheme = ThemeMode.light;

  bool isDarkMode() {
    return appTheme == ThemeMode.dark;
  }

  Future<void> loadTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final theme = prefs.getString('theme');
    if (theme == "dark") {
      appTheme = ThemeMode.dark;
    } else {
      appTheme = ThemeMode.light;
    }
    notifyListeners();
  }

  Future<void> changeThemeMode(ThemeMode nowTheme) async {
    if (appTheme == nowTheme) {
      return;
    }
    appTheme = nowTheme;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme', nowTheme == ThemeMode.dark ? "dark" : "light",);

    notifyListeners();
  }
}