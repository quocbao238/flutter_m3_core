import 'package:example/src/buttons/button_screen.dart';
import 'package:example/src/palette/palette_screen.dart';
import 'package:example/src/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:ninja_core/ninja_core.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: 'Ninja Core'),
        body: NjPadding(
          padding: const NjEdgeInsets.all(NjGapSize.regular),
          child: ListView(
            children: [
              NjButton(
                  onPressed: () =>
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ButtonScreen())),
                  text: 'Ninja Buttons'),
              NjButton(
                  onPressed: () =>
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PaletteScreen())),
                  text: 'Change M3 Base Color'),

              // const ButtonsWithoutIcon(isDisabled: false),
              // const ButtonsWithoutIcon(isDisabled: true),
              // const ButtonsWithIcon(isDisabled: true),
              // const ButtonsWithIcon(isDisabled: false),
              // const Center(child: Text('Hello World'))World
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => NinjaThemeProvider.toggleTheme(context),
          child: const Icon(Icons.add),
        ));
  }
}
