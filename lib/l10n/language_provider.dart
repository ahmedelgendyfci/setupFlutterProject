import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movies_app/utill/UserPrefrences.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'l10n.dart';

class LanguageProvider extends ChangeNotifier {
  late Locale? _locale = Locale('en');

  Locale? get locale {
    getPrefLanguage();
    return _locale;
  }

  Future<void> getPrefLanguage() async {
    await UserPreferences.init();
    String? lang = UserPreferences.getLanguagePreference();
    _locale = Locale(lang!);
    notifyListeners();
  }

  void setPrefLanguage(Locale locale) async {
    // if language not found in supported languages don't set language
    if (!L10n.all.contains(locale)) return;
    await UserPreferences.init();
    UserPreferences.setLanguagePreference(locale.toString());
    notifyListeners();
  }

  void clearLocale() {
    _locale = null;
    notifyListeners();
  }
}
