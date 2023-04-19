
import 'package:flutter/material.dart';

enum NinjaThemeMode {
  light('light'),
  dark('dark'),
  system('system');

  final String modeName;

  const NinjaThemeMode(this.modeName);

  bool get isLight => this == NinjaThemeMode.light;

  bool get isDark => this == NinjaThemeMode.dark;

  bool get isSystem => this == NinjaThemeMode.system;

  NinjaThemeMode get getCurrentThemeMode => this;

  @override
  toString() => modeName;

  static NinjaThemeMode fromString(String? modeName) =>
      NinjaThemeMode.values.firstWhere((e) => e.modeName == modeName,
          orElse: () => getModeTypeSystem());

  static NinjaThemeMode getModeTypeSystem() {
    final darkMode = WidgetsBinding.instance.window.platformBrightness;
    return darkMode == Brightness.dark
        ? NinjaThemeMode.dark
        : NinjaThemeMode.light;
  }
}
