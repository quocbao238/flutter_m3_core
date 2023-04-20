import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:ninja_core/src/ninja_theme/ninja_color_theme_extension.dart';
import 'package:ninja_core/src/ninja_theme/ninja_theme_manager.dart';
import 'package:provider/provider.dart';

class NJThemeProvider extends StatelessWidget {
  final NJThemeManager ninjaThemeManager;
  final Widget Function(BuildContext context, ThemeData themeData,
      ThemeData darkTheme, ThemeMode themeMode) builder;

  const NJThemeProvider({Key? key, required this.ninjaThemeManager, required this.builder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ninjaThemeManager.prefsThemMode(),
        builder: (context, snapshot) {
          if (snapshot.hasData == false) return const SizedBox.shrink();
          return ListenableProvider<NJThemeManager>(
            create: (context) => ninjaThemeManager,
            child: Consumer<NJThemeManager>(
              builder: (context, ninjaThemeManager, child) {
                print("Current base Color is ${ninjaThemeManager.getBaseColors}");
                return DynamicColorBuilder(
                  builder:
                      (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
                    final themes = loadColorBuilder(lightDynamic, darkDynamic,
                        ninjaThemeManager.getBaseColors);
                    return AnimatedBuilder(
                        animation: ninjaThemeManager,
                        builder: (context, child) =>
                            builder(
                                context,
                                themes['lightTheme']!,
                                themes['darkTheme']!,
                                ninjaThemeManager.getThemeMode));
                  },
                );
              },
            ),
          );
        });
  }

  static toggleTheme(BuildContext context) {
    final ninjaThemeManager =
    Provider.of<NJThemeManager>(context, listen: false);
    ninjaThemeManager.toggleThemeMode();
  }

  static changeM3Color(BuildContext context, Color newM3BaseColor) {
    final ninjaThemeManager =
    Provider.of<NJThemeManager>(context, listen: false);
    ninjaThemeManager.changeM3Color(newM3BaseColor);
  }
}

Map<String, ThemeData> loadColorBuilder(ColorScheme? lightDynamic, ColorScheme? darkDynamic, Color brandColor) {
  ColorScheme lightColorScheme;
  ColorScheme darkColorScheme;
  NinjaThemeColorExtension lightCustomColors =
  const NinjaThemeColorExtension(danger: Colors.pink);
  NinjaThemeColorExtension darkCustomColors =
  const NinjaThemeColorExtension(danger: Colors.amber);
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
