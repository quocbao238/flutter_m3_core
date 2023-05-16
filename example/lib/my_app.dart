import 'package:example/src/common/common.dart';
import 'package:example/src/screens/badge/badge_screen.dart';
import 'package:example/src/screens/buttons/button_screen.dart';
import 'package:example/src/screens/checkbox/checkbox_screen.dart';
import 'package:example/src/screens/date_picker/date_picker.dart';
import 'package:example/src/screens/dialog/dialog.dart';
import 'package:example/src/screens/fab/fab.dart';
import 'package:example/src/screens/progress/progress_screen.dart';
import 'package:example/src/screens/segment/segments.dart';
import 'package:example/src/screens/slider/slider_screen.dart';
import 'package:example/src/screens/snackbar/snack_bar_screen.dart';
import 'package:example/src/screens/switch/switch_screen.dart';
import 'package:example/src/screens/input_screen/input_screen.dart';
import 'package:example/src/screens/typography/typography_screen.dart';
import 'package:example/src/screens/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_m3_core/m3_theme_core.dart';
import 'src/screens/chips/chip_screen.dart';

final Map<String, Widget> components = {
  'M3 Typography': const TypographyScreen(),
  'M3 Buttons': const ButtonScreen(),
  'M3 Badge': const BadgeScreen(),
  'M3 CheckBox': const CheckBoxScreen(),
  'M3 Chips': const ChipScreen(),
  'M3 Dialogs': const DialogScreen(),
  'M3 FAB': const FabScreen(),
  'M3 DatePicker': const DatePicker(),
  'M3 Progress': const ProgressScreen(),
  'Segmented': const SegmentedScreen(),
  'M3 Slider': const SliderScreen(),
  'Snack Bar': const SnackBarScreen(),
  'M3 Switch': const SwitchScreen(),
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
    return const M3LayoutView(
      mobile: MobileView(),
      tablet: TabletView(),
      desktop: DesktopView(),
      another: DesktopView(),
    );
  }
}

class MobileView extends StatelessWidget {
  const MobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'M3 Theme Core'),
      body: M3Padding(
        padding: const M3EdgeInsets.all(M3Spacing.regular),
        child: ListView.builder(
          itemCount: components.length,
          itemBuilder: (context, index) => M3Padding(
            padding: const M3EdgeInsets.only(bottom: M3Spacing.medium),
            child: M3Button.outline(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => components.values.elementAt(index))),
                text: components.keys.elementAt(index)),
          ),
        ),
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
    return Scaffold(
      body: SafeArea(
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
                          return M3Padding(
                            padding: const M3EdgeInsets.only(
                                bottom: M3Spacing.medium),
                            child: SizedBox(
                              width: double.infinity,
                              child: M3Button.filled(
                                  onPressed: () => _changeIndex(index),
                                  text: text),
                            ),
                          );
                        }
                        return M3Padding(
                          padding:
                              const M3EdgeInsets.only(bottom: M3Spacing.medium),
                          child: SizedBox(
                            width: double.infinity,
                            child: M3Button.filledTonal(
                                onPressed: () => _changeIndex(index),
                                text: text),
                          ),
                        );
                      }),
                    ],
                  ),
                )),
              ),
            ),
            Expanded(
              flex: 5,
              child: M3Padding.small(
                  child: components.values.elementAt(currentIndex)),
            ),
          ],
        ),
      ),
    );
  }
}

class DesktopView extends StatefulWidget {
  const DesktopView({super.key});

  @override
  State<DesktopView> createState() => _DesktopViewState();
}

class _DesktopViewState extends State<DesktopView> {
  int currentIndex = 0;

  _changeIndex(int index) => setState(() => currentIndex = index);

  @override
  Widget build(BuildContext context) {
    final shortSize = MediaQuery.of(context).size.shortestSide;
    if (shortSize < 600) return const MobileView();
    if (shortSize < 900) return const TabletView();

    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 312,
            child: Center(
              child: M3Padding.medium(
                child: M3Card(
                    child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      M3Padding(
                        padding:
                            const M3EdgeInsets.only(bottom: M3Spacing.medium),
                        child: M3Text.titleLarge(
                          text: 'M3 Theme Core',
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      ...components.keys.map((e) {
                        int index = components.keys.toList().indexOf(e);
                        final text = e;
                        if (index == currentIndex) {
                          return M3Padding(
                            padding: const M3EdgeInsets.only(
                                bottom: M3Spacing.medium),
                            child: SizedBox(
                              width: double.infinity,
                              child: M3Button.filled(
                                  onPressed: () => _changeIndex(index),
                                  text: text),
                            ),
                          );
                        }
                        return M3Padding(
                          padding:
                              const M3EdgeInsets.only(bottom: M3Spacing.medium),
                          child: SizedBox(
                            width: double.infinity,
                            child: M3Button.filledTonal(
                                onPressed: () => _changeIndex(index),
                                text: text),
                          ),
                        );
                      }),
                    ],
                  ),
                )),
              ),
            ),
          ),
          Expanded(
              child: Center(
            child: M3Padding.small(
                child: ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 1200),
                    child: components.values.elementAt(currentIndex))),
          )),
          SizedBox(
            width: 312,
            child: Center(
              child: M3Padding.regular(
                child: M3Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const M3Text.titleMedium(
                        text: 'Change M3 Base Color',
                        maxLines: 2,
                        textAlign: TextAlign.start,
                        fontWeight: FontWeight.bold,
                      ),
                      const M3Divider(),
                      M3Padding(
                          padding: const M3EdgeInsets.symmetric(
                              horizontal: M3Spacing.medium),
                          child: M3ButtonWithIcon.filled(
                              text: isDarkTheme ? 'Light Mode' : 'Dark Mode',
                              icon: isDarkTheme
                                  ? Icons.dark_mode
                                  : Icons.light_mode,
                              onPressed: () =>
                                  M3ThemeProvider.toggleTheme(context))),
                      const M3Space.medium(),
                      Wrap(
                        spacing: M3Spacing.medium.size,
                        runSpacing: M3Spacing.small.size,
                        children: listPaletteColor.entries
                            .map(
                              (e) => M3Button(
                                  fixedSize: const Size(44, 44),
                                  text: '',
                                  backgroundColor: e.value,
                                  onPressed: () =>
                                      M3ThemeProvider.changeM3Color(
                                          context, e.value)),
                            )
                            .toList(),
                      ),
                      const M3Space.medium(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
