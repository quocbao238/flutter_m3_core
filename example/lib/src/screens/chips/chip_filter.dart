import 'package:flutter/material.dart';
import 'package:ninja_core/m3_theme_core.dart';

class InputChipFilter extends StatefulWidget {
  final String title;
  final IconData? leadingIcon;
  final Widget? deleteIcon;
  final VoidCallback? onDeleted;

  const InputChipFilter(
      {Key? key,
      this.leadingIcon,
      this.deleteIcon,
      this.onDeleted,
      required this.title})
      : super(key: key);

  @override
  State<InputChipFilter> createState() => _InputChipFilterState();
}

class _InputChipFilterState extends State<InputChipFilter> {
  bool isDisable = false;

  final List<String> selectedChips = [];

  @override
  void initState() {
    super.initState();
  }

  _onChangeDisable() => setState(() => isDisable = !isDisable);

  _onSelected(bool val, String text) => setState(
      () => val ? selectedChips.add(text) : selectedChips.remove(text));

  @override
  Widget build(BuildContext context) {
    return M3Card(
      child: Wrap(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              M3Text.titleMedium(text: widget.title),
              const M3Space.medium(),
              M3FilterChip(
                text: 'M3 Filter ${isDisable ? 'Disable' : ''}',
                selected: selectedChips.contains('M3 Filter'),
                isEnabled: !isDisable,
                leadingIcon: widget.leadingIcon,
                onSelected: (val) => _onSelected(val, 'M3 Filter'),
                // onPressed: () {},
                // leading: widget.leading,
                // isEnable: !isDisable,
                // deleteIcon: widget.deleteIcon,
                // onDeleted: widget.onDeleted,
              ),
              const M3Space.medium(),
              M3FilterChip.filled(
                text: 'M3 Filter Filled ${isDisable ? 'Disable' : ''}',
                selected: selectedChips.contains('M3 Filter Filled'),
                onSelected: (val) => _onSelected(val, 'M3 Filter Filled'),
                isEnabled: !isDisable,
                leadingIcon: widget.leadingIcon,
                // isEnable: !isDisable,
                // deleteIcon: widget.deleteIcon,
                // onDeleted: widget.onDeleted,
              ),
              const M3Space.medium(),
              M3FilterChip.filledTonal(
                text: 'M3 Filter Filled Tonal ${isDisable ? 'Disable' : ''}',
                selected: selectedChips.contains('M3 Filter Filled Tonal'),
                onSelected: (val) => _onSelected(val, 'M3 Filter Filled Tonal'),
                isEnabled: !isDisable,
                leadingIcon: widget.leadingIcon,
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
