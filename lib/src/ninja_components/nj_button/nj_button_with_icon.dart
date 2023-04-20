import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ninja_core/ninja_core.dart';
import 'package:ninja_core/src/ninja_components/nj_button/nj_button_helper.dart';
import 'package:ninja_core/src/ninja_components/nj_button/nj_button_type_enum.dart';

/// A button with icon
/// Disable Button with [onPressed] = null
/// required [text] and [icon]
class NJButtonWithIcon extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback? onPressed;
  final NjButtonType _type;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Size? fixedSize;
  final bool? reverseIcon;

  const NJButtonWithIcon({
    super.key,
    required this.text,
    required this.icon,
    this.backgroundColor,
    this.foregroundColor,
    this.fixedSize,
    this.onPressed,
    this.reverseIcon,
  }) : _type = NjButtonType.normal;

  const NJButtonWithIcon.filled({
    super.key,
    required this.text,
    required this.icon,
    this.reverseIcon,
    this.backgroundColor,
    this.fixedSize,
    this.foregroundColor,
    this.onPressed,
  }) : _type = NjButtonType.filled;

  const NJButtonWithIcon.filledTonal({
    super.key,
    required this.text,
    required this.icon,
    this.fixedSize,
    this.reverseIcon,
    this.backgroundColor,
    this.foregroundColor,
    this.onPressed,
  }) : _type = NjButtonType.filledTonal;

  const NJButtonWithIcon.outline({
    super.key,
    required this.text,
    required this.icon,
    this.reverseIcon,
    this.fixedSize,
    this.backgroundColor,
    this.foregroundColor,
    this.onPressed,
  }) : _type = NjButtonType.outline;

  const NJButtonWithIcon.text({
    super.key,
    required this.text,
    this.backgroundColor,
    this.foregroundColor,
    this.reverseIcon,
    this.fixedSize,
    required this.icon,
    this.onPressed,
  }) : _type = NjButtonType.text;

  @override
  Widget build(BuildContext context) {
    final textDirection =
        reverseIcon ?? false ? TextDirection.rtl : TextDirection.ltr;
    if (_type == NjButtonType.text) {
      return Directionality(
        textDirection: textDirection,
        child: TextButton.icon(
            style: TextButton.styleFrom(
                fixedSize: fixedSize,
                foregroundColor: foregroundColor,
                backgroundColor: backgroundColor),
            onPressed: onPressed,
            icon: Icon(icon),
            label: AutoSizeText(text)),
      );
    }

    if (_type == NjButtonType.outline) {
      return Directionality(
        textDirection: textDirection,
        child: OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
                fixedSize: fixedSize,
                foregroundColor: foregroundColor,
                backgroundColor: backgroundColor),
            onPressed: onPressed,
            icon: Icon(icon),
            label: AutoSizeText(text)),
      );
    }

    final njButtonPalette = NJButtonPalette.getPalette(context, _type);
    return Directionality(
      textDirection: textDirection,
      child: OutlinedButton.icon(
          onPressed: onPressed,
          icon: Icon(icon),
          label: AutoSizeText(text),
          style: ElevatedButton.styleFrom(
                  fixedSize: fixedSize,
                  foregroundColor:
                      foregroundColor ?? njButtonPalette.foregroundColor,
                  backgroundColor:
                      backgroundColor ?? njButtonPalette.backgroundColor)
              .copyWith(elevation: njButtonPalette.elevation)),
    );
  }
}
