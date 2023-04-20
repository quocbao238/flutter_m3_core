import 'package:example/my_app.dart';
import 'package:flutter/material.dart';
import 'package:ninja_core/ninja_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    NJThemeProvider(
        ninjaThemeManager:
            NJThemeManager(m3BaseColors: const Color(0xFF6750A4)),
        builder: (context, themeData, darkTheme, themeMode) => MaterialApp(
            title: 'Ninja Core',
            theme: themeData,
            debugShowCheckedModeBanner: false,
            darkTheme: darkTheme,
            themeMode: themeMode,
            home: const MyApp())),
  );
}
