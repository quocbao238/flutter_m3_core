import 'package:flutter/material.dart';
import 'package:ninja_core/src/ninja_components/nj_chips/nj_chip_enum_type.dart';

///Chips help people enter information,
///make selections, filter content,
///or trigger actions.
///
class NJInputChip extends StatelessWidget {
  final String text;
  final Widget? leading;
  final Widget? deleteIcon;
  final VoidCallback? onDeleted;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final NjChipType _type;

  const NJInputChip(
      {super.key,
      required this.text,
      this.leading,
      this.deleteIcon,
      this.onDeleted,
      this.backgroundColor,
      this.foregroundColor,
      this.onPressed})
      : _type = NjChipType.outline;

  const NJInputChip.filled(
      {super.key,
      required this.text,
      this.leading,
      this.deleteIcon,
      this.onDeleted,
      this.backgroundColor,
      this.foregroundColor,
      this.onPressed})
      : _type = NjChipType.filled;

  const NJInputChip.filledTonal(
      {super.key,
      required this.text,
      this.leading,
      this.deleteIcon,
      this.onDeleted,
      this.backgroundColor,
      this.foregroundColor,
      this.onPressed})
      : _type = NjChipType.filledTonal;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    Color? currentBackgroundColor = backgroundColor;
    Color? currentForegroundColor = foregroundColor;

    if (_type == NjChipType.filled) {
      currentBackgroundColor = scheme.primary;
      currentForegroundColor = scheme.onPrimary;
    }

    if (_type == NjChipType.filledTonal) {
      currentBackgroundColor = scheme.secondary.withOpacity(0.2);
      currentForegroundColor = scheme.onSecondaryContainer;
    }

    return InputChip(
      onPressed: onPressed,
      label: Text(text,
          style: TextStyle(
              color: onPressed == null ? null : currentForegroundColor)),
      backgroundColor: currentBackgroundColor,
      avatar: leading == null
          ? null
          : onPressed == null
              ? leading
              : Theme(
                  data: Theme.of(context).copyWith(
                      iconTheme: Theme.of(context)
                          .iconTheme
                          .copyWith(color: currentForegroundColor)),
                  child: leading!),
      deleteIcon: deleteIcon == null
          ? null
          : onPressed == null
              ? deleteIcon
              : Theme(
                  data: Theme.of(context).copyWith(
                      iconTheme: Theme.of(context)
                          .iconTheme
                          .copyWith(color: currentForegroundColor)),
                  child: deleteIcon!),
      onDeleted: onDeleted,
    );
  }
}
