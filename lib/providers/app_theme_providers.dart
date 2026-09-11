import 'package:flutter/material.dart';

class AppThemeProviders extends ChangeNotifier {
ThemeMode appTheme=ThemeMode.light;
bool isDarkMode() {
  return appTheme == ThemeMode.dark;
}
void changeThemeMode(ThemeMode nowTheme){
  if( appTheme==nowTheme ){
    return;

  }
  appTheme=nowTheme;
  notifyListeners();
}

}