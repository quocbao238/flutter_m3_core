import 'package:flutter/material.dart';
import 'm3_theme_color_extension.dart';

final class M3ColorBuilder {
  static Map<String, ThemeData> generateColor(
      ColorScheme? lightDynamic, ColorScheme? darkDynamic, Color brandColor) {
    ColorScheme lightColorScheme;
    ColorScheme darkColorScheme;
    M3ThemeColorExtension lightCustomColors =
        const M3ThemeColorExtension(danger: Colors.pink);
    M3ThemeColorExtension darkCustomColors =
        const M3ThemeColorExtension(danger: Colors.amber);
    lightColorScheme = ColorScheme.fromSeed(seedColor: brandColor);
    darkColorScheme = ColorScheme.fromSeed(
        seedColor: brandColor, brightness: Brightness.dark);
    final lightTheme = ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
        extensions: [lightCustomColors]);
    final darkTheme = ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
        extensions: [darkCustomColors]);
    return {'lightTheme': lightTheme, 'darkTheme': darkTheme};
  }
}
