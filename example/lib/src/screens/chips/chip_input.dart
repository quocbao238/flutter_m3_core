
import 'package:flutter/material.dart';
import 'package:ninja_core/ninja_core.dart';

class NinjaInputChipComponent extends StatefulWidget {
  final String title;
  final Widget? leading;
  final Widget? deleteIcon;
  final VoidCallback? onDeleted;

  const NinjaInputChipComponent({Key? key, this.leading, this.deleteIcon, this.onDeleted, required this.title})
      : super(key: key);

  @override
  State<NinjaInputChipComponent> createState() => _NinjaInputChipComponentState();
}

class _NinjaInputChipComponentState extends State<NinjaInputChipComponent> {
  bool isDisable = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  _onChangeDisable() => setState(() => isDisable = !isDisable);

  Null Function()? onPressed(bool isDisable) {
    return isDisable ? null : () {};
  }

  @override
  Widget build(BuildContext context) {
    return NJCard(
      width: 1280 / 3,
      child: Wrap(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NJText.titleMedium(text: widget.title),
              const NJGap.medium(),
              NJInputChip(
                text: 'NJ InputChip ${isDisable ? 'Disable' : ''}',
                onPressed: () {},
                leading: widget.leading,
                isEnable: !isDisable,
                deleteIcon: widget.deleteIcon,
                onDeleted: widget.onDeleted,
              ),
              const NJGap.medium(),
              NJInputChip.filled(
                text: 'NJ InputChip Filled ${isDisable ? 'Disable' : ''}',
                onPressed: () {},
                leading: widget.leading,
                isEnable: !isDisable,
                deleteIcon: widget.deleteIcon,
                onDeleted: widget.onDeleted,
              ),
              const NJGap.medium(),
              NJInputChip.filledTonal(
                text: 'NJ InputChip Filled Tonal ${isDisable ? 'Disable' : ''}',
                onPressed: () {},
                leading: widget.leading,
                deleteIcon: widget.deleteIcon,
                isEnable: !isDisable,
                onDeleted: widget.onDeleted,
              ),
              const NJGap.medium(),
              NJButton(onPressed: _onChangeDisable, text: 'Disable/Enable Chips')
            ],
          )
        ],
      ),
    );
  }
}
