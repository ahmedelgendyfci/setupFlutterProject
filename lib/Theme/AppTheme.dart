import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movies_app/utill/UserPrefrences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyTheme {
  // dark theme mode.
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    colorScheme: ColorScheme.dark(),
  );

  // light theme mode.
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light(),
  );
}

class ThemeProvider with ChangeNotifier {
  final key = 'theme';
  late bool _darkTheme;

  bool get darkTheme => _darkTheme;
  ThemeProvider() {
    _darkTheme = false;
    _loadFromPrefs();
  }
  void toggleTheme() {
    _darkTheme = !_darkTheme;
    log(_darkTheme.toString());
    _saveToPrefs();
    notifyListeners();
  }

  Future<void> _loadFromPrefs() async {
    await UserPreferences.init();
    _darkTheme = UserPreferences.getThemePreference()!;
    notifyListeners();
  }

  Future<void> _saveToPrefs() async {
    await UserPreferences.init();
    UserPreferences.setThemePreference(_darkTheme);
  }
}
