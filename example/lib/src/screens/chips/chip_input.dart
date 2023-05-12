import 'package:flutter/material.dart';
import 'package:ninja_core/m3_theme_core.dart';

class InputChipComponent extends StatefulWidget {
  final String title;
  final Widget? leading;
  final Widget? deleteIcon;
  final VoidCallback? onDeleted;

  const InputChipComponent(
      {Key? key,
      this.leading,
      this.deleteIcon,
      this.onDeleted,
      required this.title})
      : super(key: key);

  @override
  State<InputChipComponent> createState() => _InputChipComponentState();
}

class _InputChipComponentState extends State<InputChipComponent> {
  bool isDisable = false;

  @override
  void initState() {
    super.initState();
  }

  _onChangeDisable() => setState(() => isDisable = !isDisable);

  Null Function()? onPressed(bool isDisable) {
    return isDisable ? null : () {};
  }

  @override
  Widget build(BuildContext context) {
    return M3Card(
      width: 1280 / 3,
      child: Wrap(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              M3Text.titleMedium(text: widget.title),
              const M3Space.medium(),
              M3InputChip(
                text: 'M3 InputChip ${isDisable ? 'Disable' : ''}',
                onPressed: () {},
                leading: widget.leading,
                isEnable: !isDisable,
                deleteIcon: widget.deleteIcon,
                onDeleted: widget.onDeleted,
              ),
              const M3Space.medium(),
              M3InputChip.filled(
                text: 'M3 InputChip Filled ${isDisable ? 'Disable' : ''}',
                onPressed: () {},
                leading: widget.leading,
                isEnable: !isDisable,
                deleteIcon: widget.deleteIcon,
                onDeleted: widget.onDeleted,
              ),
              const M3Space.medium(),
              M3InputChip.filledTonal(
                text: 'M3 InputChip Filled Tonal ${isDisable ? 'Disable' : ''}',
                onPressed: () {},
                leading: widget.leading,
                deleteIcon: widget.deleteIcon,
                isEnable: !isDisable,
                onDeleted: widget.onDeleted,
              ),
              const M3Space.medium(),
              M3Button(
                  onPressed: _onChangeDisable, text: 'Disable/Enable Chips')
            ],
          )
        ],
      ),
    );
  }
}
