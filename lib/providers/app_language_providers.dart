import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLanguageProviders extends ChangeNotifier {
  String appLanguage = "en";

  Future<void> loadLanguage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    appLanguage = prefs.getString('lang') ?? "en";
    notifyListeners();
  }

  Future<void> changeLanguage(String newLanguage) async {
    if (appLanguage == newLanguage) {
      return;
    }

    appLanguage = newLanguage;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('lang', newLanguage);
    notifyListeners();
  }
}