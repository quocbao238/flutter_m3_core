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
              const NinjaInputChipComponent(
                title: 'NJ Input Chip Label Only',
              ),
              const NinjaInputChipComponent(
                title: 'NJ Input Chip Label & trailing icon',
                leading: Icon(Icons.add),
              ),
              NinjaInputChipComponent(
                title: 'NJ Input Chip Leading icon, label & trailing icon',
                leading: Icon(Icons.add),
                deleteIcon: Icon(Icons.close),
                onDeleted: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NinjaInputChipComponent extends StatelessWidget {
  final String title;
  final Widget? leading;
  final Widget? deleteIcon;
  final VoidCallback? onDeleted;

  const NinjaInputChipComponent(
      {Key? key,
      this.leading,
      this.deleteIcon,
      this.onDeleted,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NJCard(
      width: 1280 / 4,
      child: Wrap(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NJText.titleMedium(text: title),
              const NJGap.medium(),
              NJInputChip(
                text: 'NJ InputChip',
                onPressed: () {},
                leading: leading,
                deleteIcon: deleteIcon,
                onDeleted: onDeleted,
              ),
              const NJGap.medium(),
              NJInputChip(
                text: 'NJ InputChip Disable',
                leading: leading,
                deleteIcon: deleteIcon,
                onDeleted: onDeleted,
              ),
              const NJGap.medium(),
              NJInputChip.filled(
                text: 'NJ InputChip Filled',
                onPressed: () {},
                leading: leading,
                deleteIcon: deleteIcon,
                onDeleted: onDeleted,
              ),
              const NJGap.medium(),
              NJInputChip.filled(
                text: 'NJ InputChip Filled Disable',
                leading: leading,
                deleteIcon: deleteIcon,
                onDeleted: onDeleted,
              ),
              const NJGap.medium(),
              NJInputChip.filledTonal(
                text: 'NJ InputChip Filled Tonal',
                onPressed: () {},
                leading: leading,
                deleteIcon: deleteIcon,
                onDeleted: onDeleted,
              ),
              const NJGap.medium(),
              NJInputChip.filledTonal(
                text: 'NJ InputChip Filled Tonal Disable',
                leading: leading,
                deleteIcon: deleteIcon,
                onDeleted: onDeleted,
              ),
              const NJGap.medium(),
            ],
          )
        ],
      ),
    );
  }
}
