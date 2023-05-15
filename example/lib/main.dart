import 'package:example/my_app.dart';
import 'package:flutter/material.dart';
import 'package:ninja_core/m3_theme_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    M3ThemeProvider(
        m3ThemeManager: M3ThemeManager(
            m3BaseColors: const Color(0xFF6750A4), automationDayNight: true),
        m3Builder: (context, themeData, darkTheme, themeMode) => MaterialApp(
            title: 'M3 Theme Core',
            theme: themeData,
            debugShowCheckedModeBanner: false,
            darkTheme: darkTheme,
            themeMode: themeMode,
            home: const MyApp())),
  );
}
