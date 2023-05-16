import 'package:flutter/material.dart';
import 'package:flutter_m3_core/src/m3_components/m3_chips/m3_chip_enum.dart';

export 'package:flutter_m3_core/src/m3_components/m3_chips/m3_filter_chip.dart';

///Chips help people enter information,
///make selections, filter content,
///or trigger actions.
///
class M3InputChip extends StatelessWidget {
  final String text;
  final Widget? leading;
  final Widget? deleteIcon;
  final VoidCallback? onDeleted;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final M3ChipType _type;
  final bool isEnable;

  const M3InputChip(
      {super.key,
      required this.text,
      this.leading,
      this.deleteIcon,
      this.onDeleted,
      this.isEnable = false,
      this.backgroundColor,
      this.foregroundColor,
      this.onPressed})
      : _type = M3ChipType.outline;

  const M3InputChip.filled(
      {super.key,
      required this.text,
      this.leading,
      this.deleteIcon,
      this.isEnable = false,
      this.onDeleted,
      this.backgroundColor,
      this.foregroundColor,
      this.onPressed})
      : _type = M3ChipType.filled;

  const M3InputChip.filledTonal(
      {super.key,
      required this.text,
      this.leading,
      this.deleteIcon,
      this.onDeleted,
      this.backgroundColor,
      this.isEnable = false,
      this.foregroundColor,
      this.onPressed})
      : _type = M3ChipType.filledTonal;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    Color? currentBackgroundColor = backgroundColor;
    Color? currentForegroundColor = foregroundColor;

    if (_type == M3ChipType.filled) {
      currentBackgroundColor = scheme.primary;
      currentForegroundColor = scheme.onPrimary;
    }

    if (_type == M3ChipType.filledTonal) {
      currentBackgroundColor = scheme.secondary.withOpacity(0.4);
      currentForegroundColor = scheme.onSecondaryContainer;
    }

    Widget? forceColor(BuildContext context, Widget? widget) {
      if (widget == null) return null;
      if (isEnable == false) return widget;
      return Theme(
          data: Theme.of(context).copyWith(
              iconTheme: Theme.of(context)
                  .iconTheme
                  .copyWith(color: currentForegroundColor)),
          child: widget);
    }

    return InputChip(
      onPressed: onPressed,
      isEnabled: isEnable,
      label: Text(text,
          style: TextStyle(color: !isEnable ? null : currentForegroundColor)),
      backgroundColor: currentBackgroundColor,
      avatar: forceColor(context, leading),
      deleteIcon: forceColor(context, deleteIcon),
      onDeleted: onDeleted,
    );
  }
}
