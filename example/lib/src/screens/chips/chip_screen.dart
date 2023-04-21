import 'package:example/src/screens/chips/chip_filter.dart';
import 'package:example/src/screens/chips/chip_input.dart';
import 'package:example/src/screens/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:ninja_core/ninja_core.dart';

class ChipScreen extends StatelessWidget {
  const ChipScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Ninja Chips'),
      body: SingleChildScrollView(
        child: NJPadding.regular(
          child: Wrap(
            spacing: NJGapSize.medium.size,
            runSpacing: NJGapSize.medium.size,
            children: [
              const NinjaInputChipComponent(title: 'NJ Input Chip Label Only'),
              const NinjaInputChipComponent(title: 'NJ Input Chip Label & trailing icon', leading: Icon(Icons.add)),
              NinjaInputChipComponent(
                  title: 'NJ Input Chip Leading icon, label & trailing icon',
                  leading: const Icon(Icons.add),
                  deleteIcon: const Icon(Icons.close),
                  onDeleted: () {}),

              const NinjaInputChipFilter(title: 'NJ Input Chip Label Only'),
              const NinjaInputChipFilter(title: 'NJ Input Chip Leading Icon', leadingIcon: Icons.add),
              // const NinjaInputChipFilter(title: 'NJ Input Chip Label & trailing icon', leading: Icon(Icons.add)),
              // NinjaInputChipFilter(
              //     title: 'NJ Filter Chip',
              //     leading: const Icon(Icons.add),
              //     deleteIcon: const Icon(Icons.close),
              //     onDeleted: () {}
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
