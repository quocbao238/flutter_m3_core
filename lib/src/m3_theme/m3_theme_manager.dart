import 'dart:async';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:ninja_core/src/m3_components/m3_device_layout/m3_device_enum.dart';
import 'package:ninja_core/src/m3_theme/m3_day_night_helper.dart';
import 'package:ninja_core/src/m3_theme/m3_theme_mode.dart';
import 'package:ninja_core/src/m3_theme/m3_theme_prefs.dart';

final class M3ThemeManager extends ChangeNotifier {
  /// Input base color
  late Color _themeBaseColors;
  late bool _enableAutomationDayNight;

  final logger = Logger(
      printer: PrettyPrinter(methodCount: 0, colors: false, printEmojis: true));

  // /// M3DeviceService is service for get device layout
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
        DayNightHelper.isDayTimeStream().listen((themeModeResult) async {
      if (themeModeResult == _currentMode) return;
      await toggleThemeMode(isAuto: true);
    });
  }

  Future<M3ThemeMode> prefsThemMode() async =>
      await M3ThemePrefs.getCurrentThemeMode();

  Future<void> toggleThemeMode({bool isAuto = false}) async {
    // if (_enableAutomationDayNight) return;
    _currentMode == M3ThemeMode.light
        ? _currentMode = M3ThemeMode.dark
        : _currentMode = M3ThemeMode.light;
    await M3ThemePrefs.saveThemeMode(_currentMode);
    if (isAuto) {
      logger.d(
          'automationDayNight is Enable && Time now is ${_convertDateTimeToHourMinutes()} \n---> Change ThemeMode to $_currentMode ',
          '[ M3_core ]');
    } else {
      logger.d('Change ThemeMode to $_currentMode', '[ M3_core ]');
    }

    notifyListeners();
  }

  void changeM3Color(Color newM3BaseColor) {
    logger.d('Change theme color to $newM3BaseColor', '[ M3_core ]');
    _themeBaseColors = newM3BaseColor;
    notifyListeners();
  }

  M3DeviceType getCurrentDevice() => M3DeviceService.deviceType;

  Color get getBaseColors => _themeBaseColors;

  ThemeMode get getThemeMode =>
      _currentMode == M3ThemeMode.light ? ThemeMode.light : ThemeMode.dark;

  String _convertDateTimeToHourMinutes() {
    DateTime dateTime = DateTime.now();
    String hour = dateTime.hour.toString();
    String minute = dateTime.minute.toString();
    if (dateTime.hour < 10) {
      hour = '0${dateTime.hour}';
    }
    if (dateTime.minute < 10) {
      minute = '0${dateTime.minute}';
    }
    return '$hour:$minute';
  }
}
