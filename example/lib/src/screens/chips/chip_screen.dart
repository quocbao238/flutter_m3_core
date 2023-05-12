import 'package:example/src/screens/chips/chip_filter.dart';
import 'package:example/src/screens/chips/chip_input.dart';
import 'package:example/src/screens/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:ninja_core/m3_theme_core.dart';

class ChipScreen extends StatelessWidget {
  const ChipScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'M3 Chips'),
      body: SingleChildScrollView(
        child: M3Padding.regular(
          child: Wrap(
            spacing: M3Spacing.medium.size,
            runSpacing: M3Spacing.medium.size,
            children: [
              const NinjaInputChipComponent(title: 'M3 Input Chip Label Only'),
              const NinjaInputChipComponent(
                  title: 'M3 Input Chip Label & trailing icon',
                  leading: Icon(Icons.add)),
              NinjaInputChipComponent(
                  title: 'M3 Input Chip Leading icon, label & trailing icon',
                  leading: const Icon(Icons.add),
                  deleteIcon: const Icon(Icons.close),
                  onDeleted: () {}),
              const NinjaInputChipFilter(title: 'M3 Input Chip Label Only'),
              const NinjaInputChipFilter(
                  title: 'M3 Input Chip Leading Icon', leadingIcon: Icons.add),
            ],
          ),
        ),
      ),
    );
  }
}
