
import 'package:ninja_core/src/ninja_theme/ninja_theme_mode.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NinjaThemePrefs {
  static String prefsKey = 'ninja_theme_mode';

  static Future<void> saveThemeMode(NinjaThemeMode currentMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(prefsKey, currentMode.toString());
  }

  static Future<NinjaThemeMode> getCurrentThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final currentModeName = prefs.getString(prefsKey);
    return NinjaThemeMode.fromString(currentModeName);
  }

}
