import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:ninja_core/src/ninja_theme/ninja_color_theme_extension.dart';
import 'package:ninja_core/src/ninja_theme/ninja_theme_manager.dart';
import 'package:provider/provider.dart';

class NinjaThemeProvider extends StatelessWidget {
  final NinjaThemeManager ninjaThemeManager;
  final Widget Function(BuildContext context, ThemeData themeData,
      ThemeData darkTheme, ThemeMode themeMode) builder;

  const NinjaThemeProvider(
      {Key? key, required this.ninjaThemeManager, required this.builder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ninjaThemeManager.prefsThemMode(),
        builder: (context, snapshot) {
          if (snapshot.hasData == false) return const SizedBox.shrink();
          return ListenableProvider<NinjaThemeManager>(
            create: (context) => ninjaThemeManager,
            child: Consumer<NinjaThemeManager>(
              builder: (context, ninjaThemeManager, child) {
                return DynamicColorBuilder(
                  builder:
                      (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
                    final themes = loadColorBuilder(lightDynamic, darkDynamic,
                        ninjaThemeManager.getBaseColors);
                    return AnimatedBuilder(
                        animation: ninjaThemeManager,
                        builder: (context, child) => builder(
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
        Provider.of<NinjaThemeManager>(context, listen: false);
    ninjaThemeManager.toggleThemeMode();
  }

  Map<String, ThemeData> loadColorBuilder(
      ColorScheme? lightDynamic, ColorScheme? darkDynamic, Color brandColor) {
    ColorScheme lightColorScheme;
    ColorScheme darkColorScheme;

    NinjaThemeColorExtension lightCustomColors =
        const NinjaThemeColorExtension(danger: Colors.pink);
    NinjaThemeColorExtension darkCustomColors =
        const NinjaThemeColorExtension(danger: Colors.amber);
    if (lightDynamic != null && darkDynamic != null) {
      // On Android S+ devices, use the provided dynamic color scheme.
      // (Recommended) Harmonize the dynamic color scheme' built-in semantic colors.
      lightColorScheme = lightDynamic.harmonized();
      // (Optional) Customize the scheme as desired. For example, one might
      // want to use a brand color to override the dynamic [ColorScheme.secondary].
      lightColorScheme = lightColorScheme.copyWith(secondary: brandColor);
      // (Optional) If applicable, harmonize custom colors.
      lightCustomColors = lightCustomColors.harmonized(lightColorScheme);
      // Repeat for the dark color scheme.
      darkColorScheme = darkDynamic.harmonized();
      darkColorScheme = darkColorScheme.copyWith(secondary: brandColor);
      darkCustomColors = darkCustomColors.harmonized(darkColorScheme);
    } else {
      // Otherwise, use fallback schemes.
      lightColorScheme = ColorScheme.fromSeed(seedColor: brandColor);
      darkColorScheme = ColorScheme.fromSeed(
          seedColor: brandColor, brightness: Brightness.dark);
    }

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
