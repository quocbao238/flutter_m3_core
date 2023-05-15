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
  'M3 FAB': const FabScreen(),
  'M3 DatePicker': const DatePicker(),
  'M3 Progress': const ProgressScreen(),
  'Segmented': const SegmentedScreen(),
  'Slider': const SliderScreen(),
  'Snack Bar': const SnackBarScreen(),
  'Switch': const SwitchScreen(),
  'M3 Input': const TextFieldsScreen(),
};

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const M3DeviceLayout(
      mobile: Scaffold(
        appBar: CustomAppBar(title: 'M3 Theme Core'),
        body: MobileView(),
      ),
      tablet: Scaffold(
        body: TabletView(),
      ),
    );
  }
}

class MobileView extends StatelessWidget {
  const MobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return M3Padding(
      padding: const M3EdgeInsets.all(M3Spacing.regular),
      child: ListView.builder(
        itemCount: components.length,
        itemBuilder: (context, index) => M3Button.outline(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => components.values.elementAt(index))),
            text: components.keys.elementAt(index)),
      ),
    );
  }
}

class TabletView extends StatefulWidget {
  const TabletView({super.key});

  @override
  State<TabletView> createState() => _TabletViewState();
}

class _TabletViewState extends State<TabletView> {
  int currentIndex = 0;

  _changeIndex(int index) => setState(() => currentIndex = index);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: M3Padding.medium(
              child: M3Card(
                  child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ...components.keys.map((e) {
                      int index = components.keys.toList().indexOf(e);
                      final text = e;
                      if (index == currentIndex) {
                        return SizedBox(
                          width: double.infinity,
                          child: M3Button.filled(
                              onPressed: () => _changeIndex(index), text: text),
                        );
                      }
                      return SizedBox(
                        width: double.infinity,
                        child: M3Button.filledTonal(
                            onPressed: () => _changeIndex(index), text: text),
                      );
                    }),
                  ],
                ),
              )

                  // child: ListView.builder(
                  //   itemCount: components.length,
                  //   shrinkWrap: true,
                  //   physics: const NeverScrollableScrollPhysics(),
                  //   itemBuilder: (context, index) {
                  //     if (index == currentIndex) {
                  //       return M3Button.filled(
                  //         onPressed: () => _changeIndex(index),
                  //         text: components.keys
                  //             .elementAt(index)
                  //             .replaceAll('M3 ', ''),
                  //       );
                  //     }
                  //     return M3Button.filledTonal(
                  //         onPressed: () => _changeIndex(index),
                  //         text: components.keys
                  //             .elementAt(index)
                  //             .replaceAll('M3 ', ''));
                  //   },
                  // ),
                  ),
            ),
          ),
          Expanded(
            flex: 5,
            child: M3Padding.small(
                child: components.values.elementAt(currentIndex)),
          ),
        ],
      ),
    );
  }
}
