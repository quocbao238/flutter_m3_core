import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ninja_core/src/m3_components/m3_device_layout/m3_device_enum.dart';
import 'package:ninja_core/src/m3_theme/m3_day_night_helper.dart';
import 'package:ninja_core/src/m3_theme/m3_theme_mode.dart';
import 'package:ninja_core/src/m3_theme/m3_theme_prefs.dart';

final class M3ThemeManager extends ChangeNotifier {
  /// Input base color
  late Color _themeBaseColors;
  late bool _enableAutomationDayNight;

  // /// M3DeviceService is service for get device layout
  // late M3DeviceService _m3deviceService;

  late M3ThemeMode _currentMode = M3ThemeMode.light;
  StreamSubscription<M3ThemeMode>? _streamSubscription;

  /// "m3BaseColors" is base color for theme
  /// "automationDayNight" is enable automation day night
  M3ThemeManager({required Color m3BaseColors, bool? automationDayNight}) {
    _themeBaseColors = m3BaseColors;
    _enableAutomationDayNight = automationDayNight ?? false;
    M3DeviceService.init();
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

  Future<M3ThemeMode> prefsThemMode() async =>
      await M3ThemePrefs.getCurrentThemeMode();

  Future<void> toggleThemeMode() async {
    if (_enableAutomationDayNight) return;
    _currentMode == M3ThemeMode.light
        ? _currentMode = M3ThemeMode.dark
        : _currentMode = M3ThemeMode.light;
    await M3ThemePrefs.saveThemeMode(_currentMode);
    notifyListeners();
  }

  void changeM3Color(Color newM3BaseColor) {
    _themeBaseColors = newM3BaseColor;
    notifyListeners();
  }

  M3DeviceType getCurrentDevice() => M3DeviceService.deviceType;

  Color get getBaseColors => _themeBaseColors;

  ThemeMode get getThemeMode =>
      _currentMode == M3ThemeMode.light ? ThemeMode.light : ThemeMode.dark;
}
