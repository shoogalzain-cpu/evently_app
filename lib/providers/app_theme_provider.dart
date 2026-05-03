import 'package:flutter/material.dart';

class AppThemeProvider extends ChangeNotifier{

  ThemeMode appTheme = ThemeMode.light;


  void changeTheme (ThemeMode newTheme){
    if(appTheme == newTheme){
      return;
    }
    appTheme = newTheme;
    notifyListeners();
  }
  bool get isDarkMode => appTheme == ThemeMode.dark;

  bool isDarkModeCheck(){
    return appTheme == ThemeMode.dark;
  }

}