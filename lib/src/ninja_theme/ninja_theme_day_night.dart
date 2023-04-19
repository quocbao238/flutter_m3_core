import 'package:ninja_core/src/ninja_theme/ninja_theme_mode.dart';

class DayNightHelper {
  static NinjaThemeMode getThemeModeByTime(DateTime dateTime) {
    final hour = dateTime.hour;
    return (hour >= 6 && hour < 18)
        ? NinjaThemeMode.light
        : NinjaThemeMode.dark;
  }

  // Function Stream DayNight
  static Stream<NinjaThemeMode> isDayTimeStream() {
    return Stream.periodic(
        const Duration(seconds: 1), (x) => getThemeModeByTime(DateTime.now()));
  }
}
