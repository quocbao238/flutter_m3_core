import 'package:example/my_app.dart';
import 'package:flutter/material.dart';
import 'package:ninja_core/ninja_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    NinjaThemeProvider(
        ninjaThemeManager: NinjaThemeManager(m3BaseColors: Colors.cyanAccent),
        builder: (context, themeData, darkTheme, themeMode) => MaterialApp(
            title: 'Ninja Core',
            theme: themeData,
            darkTheme: darkTheme,
            themeMode: themeMode,
            home: const MyApp())),
  );
}
