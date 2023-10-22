import 'dart:async';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:flutter_m3_core/src/m3_components/m3_device_layout/m3_device_enum.dart';
import 'package:flutter_m3_core/src/m3_theme/m3_day_night_helper.dart';
import 'package:flutter_m3_core/src/m3_theme/m3_theme_mode.dart';
import 'package:flutter_m3_core/src/m3_theme/m3_theme_prefs.dart';

final class M3ThemeManager extends ChangeNotifier {
  late Color _themeBaseColors;
  late bool _enableAutomationDayNight;
  late bool _saveBaseColor;

  final logger = Logger(printer: PrettyPrinter(methodCount: 0, colors: false, printEmojis: true));

  // /// M3DeviceService is service for get device layout
  late M3ThemeMode _currentMode = M3ThemeMode.light;
  StreamSubscription<M3ThemeMode>? _streamSubscription;

  /// "m3BaseColors" is base color for theme
  /// "automationDayNight" enble ->  auto change theme mode by time
  /// "saveBaseColor" enble ->  save last color user selected to local storage
  M3ThemeManager({required Color m3BaseColors, bool? automationDayNight, bool? saveBaseColor}) {
    _themeBaseColors = m3BaseColors;
    _enableAutomationDayNight = automationDayNight ?? false;
    _saveBaseColor = saveBaseColor ?? false;
    _listenDayNightTime();
  }

  @override
  dispose() {
    _streamSubscription?.cancel();
    super.dispose();
  }

  _listenDayNightTime() {
    if (!_enableAutomationDayNight) return;
    _streamSubscription = DayNightHelper.isDayTimeStream().listen((themeModeResult) async {
      if (themeModeResult == _currentMode) return;
      await toggleThemeMode(isAuto: true);
    });
  }

  Future<M3ThemeMode> prefsThemMode(BuildContext context) async {
    M3ViewService.getViewType(context);
    _currentMode = await M3ThemePrefs.getCurrentThemeMode();
    _themeBaseColors = await M3ThemePrefs.getCurrentBaseColor(_themeBaseColors);
    return await M3ThemePrefs.getCurrentThemeMode();
  }

  Future<void> toggleThemeMode({bool isAuto = false}) async {
    // Disable automation day night if user change theme mode
    if (!isAuto) {
      _enableAutomationDayNight = false;
      _streamSubscription?.cancel();
      logger.d('automationDayNight is Disable\nBecause user change Theme Mode\n---> Now Theme Mode is $_currentMode ',
          '[ M3_core ]');
    }

    _currentMode == M3ThemeMode.light ? _currentMode = M3ThemeMode.dark : _currentMode = M3ThemeMode.light;
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

  Future<void> changeM3Color(Color newM3BaseColor) async {
    logger.d('Change theme color to $newM3BaseColor', '[ M3_core ]');
    _themeBaseColors = newM3BaseColor;
    if (_saveBaseColor) {
      await M3ThemePrefs.saveBaseColor(_themeBaseColors);
    }
    notifyListeners();
  }

  M3ViewType getCurrentDevice() => M3ViewService.m3ViewType;

  Color get getBaseColors => _themeBaseColors;

  ThemeMode get getThemeMode => _currentMode == M3ThemeMode.light ? ThemeMode.light : ThemeMode.dark;

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
