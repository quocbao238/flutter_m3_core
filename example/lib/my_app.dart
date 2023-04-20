import 'package:example/src/screens/buttons/button_screen.dart';
import 'package:example/src/screens/typography/typography_screen.dart';
import 'package:example/src/screens/widgets/custom_app_bar.dart';
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
        body: NJPadding(
          padding: const NJEdgeInsets.all(NJGapSize.regular),
          child: ListView(
            children: [
              NJButton.outline(
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ButtonScreen())),
                  text: 'Ninja Buttons'),
              const NJGap.medium(),
              NJButton.outline(
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const TypographyScreen())),
                  text: 'Ninja Typography'),

              // const ButtonsWithoutIcon(isDisabled: false),
              // const ButtonsWithoutIcon(isDisabled: true),
              // const ButtonsWithIcon(isDisabled: true),
              // const ButtonsWithIcon(isDisabled: false),
              // const Center(child: Text('Hello World'))World
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => NJThemeProvider.toggleTheme(context),
          child: const Icon(Icons.add),
        ));
  }
}
