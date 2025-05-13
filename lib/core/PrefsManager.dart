import 'package:shared_preferences/shared_preferences.dart';

class PrefsManager {
  static late SharedPreferences prefs;

  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static saveThemeMode(bool newTheme) {
    prefs.setBool("theme", newTheme);
    print("Saved theme: $newTheme");
  }

  static bool getThemeMode() {
    bool theme = prefs.getBool("theme") ?? false;
    print("Loaded theme: $theme");
    return theme;
  }
}
