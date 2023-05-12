import 'package:flutter/material.dart';

enum M3ThemeMode {
  light('light'),
  dark('dark'),
  system('system');

  final String modeName;
  const M3ThemeMode(this.modeName);

  bool get isLight => this == M3ThemeMode.light;

  bool get isDark => this == M3ThemeMode.dark;

  bool get isSystem => this == M3ThemeMode.system;

  M3ThemeMode get getCurrentThemeMode => this;

  @override
  toString() => modeName;

  static M3ThemeMode fromString(String? modeName) =>
      M3ThemeMode.values.firstWhere((e) => e.modeName == modeName,
          orElse: () => getModeTypeSystem());

  static M3ThemeMode getModeTypeSystem() =>
      // ignore: deprecated_member_use
      WidgetsBinding.instance.window.platformBrightness == Brightness.dark
          ? M3ThemeMode.dark
          : M3ThemeMode.light;
}
