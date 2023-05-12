import 'package:example/src/screens/badge/badge_screen.dart';
import 'package:example/src/screens/buttons/button_screen.dart';
import 'package:example/src/screens/checkbox/checkbox_screen.dart';
import 'package:example/src/screens/dialog/dialog.dart';
import 'package:example/src/screens/fab/fab.dart';
import 'package:example/src/screens/icon_button/icon_button.dart';
import 'package:example/src/screens/typography/typography_screen.dart';
import 'package:example/src/screens/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:ninja_core/m3_theme_core.dart';
import 'src/screens/chips/chip_screen.dart';

final Map<String, Widget> components = {
  'M3 Typography': const TypographyScreen(),
  'M3 Buttons': const ButtonScreen(),
  'M3 Badge': const BadgeScreen(),
  'M3 CheckBox': const CheckBoxScreen(),
  'M3 Chips': const ChipScreen(),
  'M3 Dialogs': const DialogScreen(),
  'M3 Floating Action Button': const FabScreen(),
  'M3 Icon Button': const IconButtonScreen(),
};

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: 'M3 Theme Core'),
        body: M3Padding(
          padding: const M3EdgeInsets.all(M3Spacing.regular),
          child: ListView.builder(
            itemCount: components.length,
            itemBuilder: (context, index) => M3Button.outline(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => components.values.elementAt(index))),
                text: components.keys.elementAt(index)),
          ),

          //  ListView(
          //   children: [

          //     NJButton.outline(
          //         onPressed: () => Navigator.of(context).push(MaterialPageRoute(
          //             builder: (context) => const ButtonScreen())),
          //         text: 'M3 Buttons'),
          //     const NJGap.medium(),
          //     NJButton.outline(
          //         onPressed: () => Navigator.of(context).push(MaterialPageRoute(
          //             builder: (context) => const TypographyScreen())),
          //         text: 'M3 Typography'),
          //     const NJGap.medium(),
          //     NJButton.outline(
          //         onPressed: () => Navigator.of(context).push(MaterialPageRoute(
          //             builder: (context) => const BadgeScreen())),
          //         text: 'M3 Badge'),

          //     const NJGap.medium(),
          //     NJButton.outline(
          //         onPressed: () => Navigator.of(context).push(MaterialPageRoute(
          //             builder: (context) => const CheckBoxScreen())),
          //         text: 'M3 CheckBox'),

          //     const NJGap.medium(),
          //     NJButton.outline(
          //         onPressed: () => Navigator.of(context).push(MaterialPageRoute(
          //             builder: (context) => const ChipScreen())),
          //         text: 'M3 Chips'),
          //     const NJGap.medium(),
          //     NJButton.outline(
          //         onPressed: () => Navigator.of(context).push(MaterialPageRoute(
          //             builder: (context) => const DialogScreen())),
          //         text: 'M3 Dialogs'),
          //     const NJGap.medium(),
          //     NJButton.outline(
          //         onPressed: () => Navigator.of(context).push(MaterialPageRoute(
          //             builder: (context) => const FabScreen())),
          //         text: 'M3 Floating Action Button'),
          //     const NJGap.medium(),
          //     NJButton.outline(
          //         onPressed: () => Navigator.of(context).push(MaterialPageRoute(
          //             builder: (context) => const IconButtonScreen())),
          //         text: 'M3 Icon Button'),

          //     const NJGap.medium(),

          //     NJButton.outline(
          //         onPressed: () => Navigator.of(context).push(MaterialPageRoute(
          //             builder: (context) => const DatePicker())),
          //         text: 'M3 Date Picker'),
          //     // const NJGap.medium(),
          //     // NJButton.outline(
          //     //     onPressed: () => M3DatePicker.showModalDateRangePicker(context, onDateSelected: (val) {}),
          //     //     text: 'Show Date Range Picker'),
          //     // const NJGap.medium(),
          //     //
          //     // NJButton.outline(
          //     //     onPressed: () =>
          //     //         M3DatePicker.showModalTimePicker(context,
          //     //             helpText: 'Select Time',
          //     //             onDateSelected: (val) {}, initialTime: TimeOfDay.now()),
          //     //     text: 'Show Time Picker'),

          //     // const ButtonsWithoutIcon(isDisabled: false),
          //     // const ButtonsWithoutIcon(isDisabled: true),x`
          //     // const ButtonsWithIcon(isDisabled: true),
          //     // const ButtonsWithIcon(isDisabled: false),
          //     // const Center(child: Text('Hello World'))World
          //   ],
          // ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => M3ThemeProvider.toggleTheme(context),
          child: const Icon(Icons.add),
        ));
  }
}
