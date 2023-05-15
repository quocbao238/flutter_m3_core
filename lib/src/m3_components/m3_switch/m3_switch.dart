import 'package:flutter/material.dart';
import 'm3_switch_enum.dart';

class M3Switch extends StatelessWidget {
  final bool value;
  final Function(bool)? onChanged;
  final IconData? selectedIcon;
  final IconData? normalIcon;
  final M3SwitchType _type;

  const M3Switch({
    Key? key,
    required this.value,
    required this.onChanged,
    this.selectedIcon,
    this.normalIcon,
  })  : _type = M3SwitchType.normal,
        super(key: key);

  const M3Switch.adaptive({
    Key? key,
    required this.value,
    required this.onChanged,
  })  : _type = M3SwitchType.adaptive,
        selectedIcon = null,
        normalIcon = null,
        super(key: key);

  const M3Switch.primary({
    Key? key,
    required this.value,
    required this.onChanged,
    this.selectedIcon,
    this.normalIcon,
  })  : _type = M3SwitchType.primary,
        super(key: key);

  const M3Switch.tertiary({
    Key? key,
    required this.value,
    required this.onChanged,
    this.selectedIcon,
    this.normalIcon,
  })  : _type = M3SwitchType.tertiary,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (_type == M3SwitchType.adaptive) {
      return Switch.adaptive(
          value: value,
          onChanged: onChanged,
          thumbIcon: _type.thumbIcon(
              normalIcon: normalIcon, selectedIcon: selectedIcon),
          thumbColor: _type.thumbColor(Theme.of(context).colorScheme));
    }
    return Switch(
        value: value,
        onChanged: onChanged,
        thumbIcon:
            _type.thumbIcon(normalIcon: normalIcon, selectedIcon: selectedIcon),
        thumbColor: _type.thumbColor(Theme.of(context).colorScheme));
  }
}
