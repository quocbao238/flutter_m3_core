import 'package:example/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_m3_core/m3_theme_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const App());
}

class App extends StatelessWidget {
  final m3BaseColors = const Color(0xFF6750A4);
  const App({super.key});

  @override
  Widget build(BuildContext context) {

    return M3ThemeProvider(
        m3ThemeManager: M3ThemeManager(
            m3BaseColors: m3BaseColors, automationDayNight: true),
        m3Builder: (context, themeData, darkTheme, themeMode) => MaterialApp(
            title: 'Flutter M3 Core',
            theme: themeData,
            debugShowCheckedModeBanner: false,
            darkTheme: darkTheme,
            themeMode: themeMode,
            home: const MyApp()));
  }
}
