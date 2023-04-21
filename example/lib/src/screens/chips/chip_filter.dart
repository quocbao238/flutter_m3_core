import 'package:flutter/material.dart';
import 'package:ninja_core/ninja_core.dart';

class NinjaInputChipFilter extends StatefulWidget {
  final String title;
  final IconData? leadingIcon;
  final Widget? deleteIcon;
  final VoidCallback? onDeleted;

  const NinjaInputChipFilter({Key? key, this.leadingIcon, this.deleteIcon, this.onDeleted, required this.title})
      : super(key: key);

  @override
  State<NinjaInputChipFilter> createState() => _NinjaInputChipFilterState();
}

class _NinjaInputChipFilterState extends State<NinjaInputChipFilter> {
  bool isDisable = false;

  final List<String> selectedChips = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  _onChangeDisable() => setState(() => isDisable = !isDisable);

  _onSelected(bool val, String text) => setState(() => val ? selectedChips.add(text) : selectedChips.remove(text));

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
              NJFilterChip(
                text: 'NJ Filter ${isDisable ? 'Disable' : ''}',
                selected: selectedChips.contains('NJ Filter'),
                isEnabled: !isDisable,
                leadingIcon: widget.leadingIcon,
                onSelected: (val) => _onSelected(val, 'NJ Filter'),
                // onPressed: () {},
                // leading: widget.leading,
                // isEnable: !isDisable,
                // deleteIcon: widget.deleteIcon,
                // onDeleted: widget.onDeleted,
              ),
              const NJGap.medium(),
              NJFilterChip.filled(
                text: 'NJ Filter Filled ${isDisable ? 'Disable' : ''}',
                selected: selectedChips.contains('NJ Filter Filled'),
                onSelected: (val) => _onSelected(val, 'NJ Filter Filled'),
                isEnabled: !isDisable,
                leadingIcon: widget.leadingIcon,
                // isEnable: !isDisable,
                // deleteIcon: widget.deleteIcon,
                // onDeleted: widget.onDeleted,
              ),
              const NJGap.medium(),
              NJFilterChip.filledTonal(
                text: 'NJ Filter Filled Tonal ${isDisable ? 'Disable' : ''}',
                selected: selectedChips.contains('NJ Filter Filled Tonal'),
                onSelected: (val) => _onSelected(val, 'NJ Filter Filled Tonal'),
                isEnabled: !isDisable,
                leadingIcon: widget.leadingIcon,
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
