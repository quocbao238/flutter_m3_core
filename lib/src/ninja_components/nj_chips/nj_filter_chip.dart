import 'package:flutter/material.dart';
import 'package:ninja_core/src/ninja_components/nj_chips/nj_chip_enum_type.dart';

class NJFilterChip extends StatelessWidget {
  final String text;
  final bool selected;
  final Function(bool)? onSelected;
  final bool isEnabled;
  final NjChipType? _type;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final IconData? leadingIcon;

  const NJFilterChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
    this.isEnabled = true,
    this.backgroundColor,
    this.foregroundColor,
    this.leadingIcon,
  }) : _type = NjChipType.outline;

  const NJFilterChip.filled(
      {super.key,
      required this.text,
      required this.selected,
      this.onSelected,
      this.leadingIcon,
      this.isEnabled = true,
      this.backgroundColor,
      this.foregroundColor})
      : _type = NjChipType.filled;

  const NJFilterChip.filledTonal(
      {super.key,
      required this.text,
      required this.selected,
      this.onSelected,
      this.leadingIcon,
      this.isEnabled = true,
      this.backgroundColor,
      this.foregroundColor})
      : _type = NjChipType.filledTonal;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    Color? currentBackgroundColor = backgroundColor;
    Color? currentForegroundColor = foregroundColor;

    if (_type == NjChipType.filled && isEnabled) {
      currentBackgroundColor = scheme.primary;
      currentForegroundColor = scheme.onPrimary;
    }

    if (_type == NjChipType.filledTonal && isEnabled) {
      currentBackgroundColor = scheme.secondary;
      currentForegroundColor = scheme.onSecondary;
    }

    Widget? forceColor(BuildContext context, IconData? leadingIcon) {
      if (leadingIcon == null) return null;
      if (selected == true) return null;
      // if (isEnabled == false) return widget;
      return Icon(leadingIcon, color: currentForegroundColor, size: 18.0);
    }

    return FilterChip(
      label: Text(text, style: TextStyle(color: !isEnabled ? null : currentForegroundColor)),
      selected: selected,
      selectedColor: currentBackgroundColor,
      checkmarkColor: currentForegroundColor,
      backgroundColor: currentBackgroundColor,
      avatar: forceColor(context, leadingIcon),
      onSelected: isEnabled ? onSelected : null,
    );
  }
}
