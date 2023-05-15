import 'package:example/src/screens/badge/badge_screen.dart';
import 'package:example/src/screens/buttons/button_screen.dart';
import 'package:example/src/screens/checkbox/checkbox_screen.dart';
import 'package:example/src/screens/date_picker/date_picker.dart';
import 'package:example/src/screens/dialog/dialog.dart';
import 'package:example/src/screens/fab/fab.dart';
import 'package:example/src/screens/icon_button/icon_button.dart';
import 'package:example/src/screens/progress/progress_screen.dart';
import 'package:example/src/screens/segment/segments.dart';
import 'package:example/src/screens/slider/slider_screen.dart';
import 'package:example/src/screens/snackbar/snack_bar_screen.dart';
import 'package:example/src/screens/switch/switch_screen.dart';
import 'package:example/src/screens/input_screen/input_screen.dart';
import 'package:example/src/screens/typography/typography_screen.dart';
import 'package:example/src/screens/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:ninja_core/m3_theme_core.dart';
import 'src/screens/chips/chip_screen.dart';

final Map<String, Widget> components = {
  'M3 Typography': const TypographyScreen(),
  'M3 Buttons': const ButtonScreen(),
  'M3 IconButton': const IconButtonScreen(),
  'M3 Badge': const BadgeScreen(),
  'M3 CheckBox': const CheckBoxScreen(),
  'M3 Chips': const ChipScreen(),
  'M3 Dialogs': const DialogScreen(),
  'M3 FloatingActionButton': const FabScreen(),
  'M3 DatePicker': const DatePicker(),
  'M3 Progress Indicator': const ProgressScreen(),
  'Segmented': const SegmentedScreen(),
  'Slider': const SliderScreen(),
  'Snack Bar': const SnackBarScreen(),
  'Switch': const SwitchScreen(),
  'M3 TextField': const TextFieldsScreen(),
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
        body: M3DeviceLayout(
          mobile: M3Padding(
            padding: const M3EdgeInsets.all(M3Spacing.regular),
            child: ListView.builder(
              itemCount: components.length,
              itemBuilder: (context, index) => M3Button.outline(
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          components.values.elementAt(index))),
                  text: components.keys.elementAt(index)),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => M3ThemeProvider.toggleTheme(context),
          child: const Icon(Icons.add),
        ));
  }
}
