import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:ninja_core/src/m3_theme/m3_theme_manager.dart';
import 'package:provider/provider.dart';
import 'm3_color_builder.dart';

class M3ThemeProvider extends StatelessWidget {
  final M3ThemeManager m3ThemeManager;

  // Call back builder
  final Widget Function(BuildContext context, ThemeData themeData,
      ThemeData darkTheme, ThemeMode themeMode) builder;

  
  const M3ThemeProvider(
      {Key? key, required this.m3ThemeManager, required this.builder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: m3ThemeManager.prefsThemMode(),
        builder: (context, snapshot) {
          if (snapshot.hasData == false) return const SizedBox.shrink();
          return ListenableProvider<M3ThemeManager>(
            create: (context) => m3ThemeManager,
            child: Consumer<M3ThemeManager>(
              builder: (context, ninjaThemeManager, child) {
                return DynamicColorBuilder(
                  builder:
                      (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
                    final themes = M3ColorBuilder.generateColor(lightDynamic,
                        darkDynamic, ninjaThemeManager.getBaseColors);
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

  static toggleTheme(BuildContext context) =>
      Provider.of<M3ThemeManager>(context, listen: false).toggleThemeMode();

  static changeM3Color(BuildContext context, Color newM3BaseColor) =>
      Provider.of<M3ThemeManager>(context, listen: false)
          .changeM3Color(newM3BaseColor);
}
