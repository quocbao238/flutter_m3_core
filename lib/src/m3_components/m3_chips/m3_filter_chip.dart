import 'package:flutter/material.dart';
import 'package:ninja_core/src/m3_components/m3_chips/m3_chip_enum.dart';

class M3FilterChip extends StatelessWidget {
  final String text;
  final bool selected;
  final Function(bool)? onSelected;
  final bool isEnabled;
  final M3ChipType? _type;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final IconData? leadingIcon;

  const M3FilterChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
    this.isEnabled = true,
    this.backgroundColor,
    this.foregroundColor,
    this.leadingIcon,
  }) : _type = M3ChipType.outline;

  const M3FilterChip.filled(
      {super.key,
      required this.text,
      required this.selected,
      this.onSelected,
      this.leadingIcon,
      this.isEnabled = true,
      this.backgroundColor,
      this.foregroundColor})
      : _type = M3ChipType.filled;

  const M3FilterChip.filledTonal(
      {super.key,
      required this.text,
      required this.selected,
      this.onSelected,
      this.leadingIcon,
      this.isEnabled = true,
      this.backgroundColor,
      this.foregroundColor})
      : _type = M3ChipType.filledTonal;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    Color? currentBackgroundColor = backgroundColor;
    Color? currentForegroundColor = foregroundColor;

  
    if (_type == M3ChipType.filled && isEnabled) {
      currentBackgroundColor = scheme.primary;
      currentForegroundColor = scheme.onPrimary;
    }

    if (_type == M3ChipType.filledTonal && isEnabled) {
      currentBackgroundColor = scheme.secondary;
      currentForegroundColor = scheme.onSecondary;
    }

    Widget? forceColor(BuildContext context, IconData? leadingIcon) {
      if (leadingIcon == null) return null;
      if (selected == true) return null;
      return Icon(leadingIcon, color: currentForegroundColor, size: 18.0);
    }

    return FilterChip(
      label: Text(text,
          style: TextStyle(color: !isEnabled ? null : currentForegroundColor)),
      selected: selected,
      selectedColor: currentBackgroundColor,
      checkmarkColor: currentForegroundColor,
      backgroundColor: currentBackgroundColor,
      avatar: forceColor(context, leadingIcon),
      onSelected: isEnabled ? onSelected : null,
    );
  }
}
