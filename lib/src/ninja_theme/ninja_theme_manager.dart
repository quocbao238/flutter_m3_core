import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ninja_core/src/ninja_theme/ninja_theme_day_night.dart';
import 'package:ninja_core/src/ninja_theme/ninja_theme_mode.dart';
import 'package:ninja_core/src/ninja_theme/ninja_theme_prefs.dart';

/// NinjaThemeManager is a class that manages the theme of the application.
/// Only supports material 3 themes.
class NJThemeManager extends ChangeNotifier {
  // Input
  late Color _themeBaseColors;
  late bool _enableAutomationDayNight;
  late bool _usePrefsColor;

  // Output
  late NinjaThemeMode _currentMode = NinjaThemeMode.light;
  StreamSubscription<NinjaThemeMode>? _streamSubscription;

  NJThemeManager({required Color m3BaseColors, bool? automationDayNight}) {
    _themeBaseColors = m3BaseColors;
    _enableAutomationDayNight = automationDayNight ?? false;
    _listenDayNightTime();
  }

  @override
  dispose() {
    _streamSubscription?.cancel();
    super.dispose();
  }

  _listenDayNightTime() {
    if (!_enableAutomationDayNight) return;
    _streamSubscription =
        DayNightHelper.isDayTimeStream().listen((themeModeResult) {
      if (themeModeResult == _currentMode) return;
      toggleThemeMode();
    });
  }

  Future<NinjaThemeMode> prefsThemMode() async {
    _currentMode = await NinjaThemePrefs.getCurrentThemeMode();
    return _currentMode;
  }

  Future<void> toggleThemeMode() async {
    if (_enableAutomationDayNight) return;
    _currentMode == NinjaThemeMode.light
        ? _currentMode = NinjaThemeMode.dark
        : _currentMode = NinjaThemeMode.light;
    await NinjaThemePrefs.saveThemeMode(_currentMode);
    notifyListeners(

    );
  }

  void changeM3Color(Color newM3BaseColor) {
    _themeBaseColors = newM3BaseColor;
    notifyListeners();
  }

  Color get getBaseColors => _themeBaseColors;


  ThemeMode get getThemeMode =>
      _currentMode == NinjaThemeMode.light ? ThemeMode.light : ThemeMode.dark;
}
