import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_m3_core/src/m3_components/m3_device_layout/m3_device_enum.dart';
import 'package:flutter_m3_core/src/m3_theme/m3_theme_manager.dart';
import 'package:provider/provider.dart';
import 'm3_color_builder.dart';

typedef M3Builder = Widget Function(BuildContext context, ThemeData themeData,
    ThemeData darkTheme, ThemeMode themeMode);

final class M3ThemeProvider extends StatelessWidget {
  final M3ThemeManager m3ThemeManager;

  // Call back builder
  final M3Builder m3Builder;

  /// M3ThemeProvider is provider for theme
  /// "m3ThemeManager" is M3ThemeManager
  /// "builder" is call back builder
  const M3ThemeProvider(
      {Key? key, required this.m3ThemeManager, required this.m3Builder})
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
              builder: (context, m3ThemeManager, child) {
                return DynamicColorBuilder(
                  builder:
                      (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
                    final themes = M3ColorBuilder.generateColor(lightDynamic,
                        darkDynamic, m3ThemeManager.getBaseColors);
                    return AnimatedBuilder(
                        animation: m3ThemeManager,
                        builder: (context, child) => m3Builder(
                            context,
                            themes['lightTheme']!,
                            themes['darkTheme']!,
                            m3ThemeManager.getThemeMode));
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

  static M3DeviceType getCurrentDevice(BuildContext context) =>
      Provider.of<M3ThemeManager>(context, listen: false).getCurrentDevice();
}
