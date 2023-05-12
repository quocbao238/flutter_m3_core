import 'package:ninja_core/src/m3_theme/m3_theme_mode.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class M3ThemePrefs {
  static String prefsKey = 'm3`_theme_mode';

  static Future<void> saveThemeMode(M3ThemeMode currentMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(prefsKey, currentMode.toString());
  }

  static Future<M3ThemeMode> getCurrentThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final currentModeName = prefs.getString(prefsKey);
    return M3ThemeMode.fromString(currentModeName);
  }
}
