import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static SharedPreferences? _preferences;

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static bool? getThemePreference() {
    return _preferences!.getBool('theme');
  }

  static setThemePreference(bool isDark) async {
    await _preferences!.setBool('theme', isDark);
  }

  static String? getLanguagePreference() {
    return _preferences!.getString('lang');
  }

  static setLanguagePreference(String language) async {
    await _preferences!.setString('lang', language);
  }
}
