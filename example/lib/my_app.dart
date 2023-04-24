import 'package:example/src/screens/badge/badge_screen.dart';
import 'package:example/src/screens/buttons/button_screen.dart';
import 'package:example/src/screens/checkbox/checkbox_screen.dart';
import 'package:example/src/screens/date_picker/date_picker.dart';
import 'package:example/src/screens/dialog/dialog.dart';
import 'package:example/src/screens/fab/fab.dart';
import 'package:example/src/screens/icon_button/icon_button.dart';
import 'package:example/src/screens/typography/typography_screen.dart';
import 'package:example/src/screens/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:ninja_core/ninja_core.dart';

import 'src/screens/chips/chip_screen.dart';

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
                  onPressed: () =>
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ButtonScreen())),
                  text: 'Ninja Buttons'),
              const NJGap.medium(),
              NJButton.outline(
                  onPressed: () =>
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const TypographyScreen())),
                  text: 'Ninja Typography'),
              const NJGap.medium(),
              NJButton.outline(
                  onPressed: () =>
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const BadgeScreen())),
                  text: 'Ninja Badge'),

              const NJGap.medium(),
              NJButton.outline(
                  onPressed: () =>
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CheckBoxScreen())),
                  text: 'Ninja CheckBox'),

              const NJGap.medium(),
              NJButton.outline(
                  onPressed: () =>
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ChipScreen())),
                  text: 'Ninja Chips'),
              const NJGap.medium(),
              NJButton.outline(
                  onPressed: () =>
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const DialogScreen())),
                  text: 'Ninja Dialogs'),
              const NJGap.medium(),
              NJButton.outline(
                  onPressed: () =>
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const FabScreen())),
                  text: 'Ninja Floating Action Button'),
              const NJGap.medium(),
              NJButton.outline(
                  onPressed: () =>
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const IconButtonScreen())),
                  text: 'Ninja Icon Button'),

              const NJGap.medium(),

              NJButton.outline(
                  onPressed: () =>
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const DatePicker())),
                  text: 'Ninja Date Picker'),
              // const NJGap.medium(),
              // NJButton.outline(
              //     onPressed: () => M3DatePicker.showModalDateRangePicker(context, onDateSelected: (val) {}),
              //     text: 'Show Date Range Picker'),
              // const NJGap.medium(),
              //
              // NJButton.outline(
              //     onPressed: () =>
              //         M3DatePicker.showModalTimePicker(context,
              //             helpText: 'Select Time',
              //             onDateSelected: (val) {}, initialTime: TimeOfDay.now()),
              //     text: 'Show Time Picker'),

              // const ButtonsWithoutIcon(isDisabled: false),
              // const ButtonsWithoutIcon(isDisabled: true),x`
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
