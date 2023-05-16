import 'package:flutter_m3_core/src/m3_theme/m3_theme_mode.dart';

final class DayNightHelper {
  static const int _morningHour = 6;
  static const int _nightHour = 18;
  static M3ThemeMode getThemeModeByTime(DateTime dateTime) =>
      (dateTime.hour >= _morningHour && dateTime.hour < _nightHour)
          ? M3ThemeMode.light
          : M3ThemeMode.dark;

  // Function Stream DayNight
  static Stream<M3ThemeMode> isDayTimeStream() => Stream.periodic(
      const Duration(seconds: 1), (x) => getThemeModeByTime(DateTime.now()));
}
