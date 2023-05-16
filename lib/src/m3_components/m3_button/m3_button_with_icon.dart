import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_m3_core/src/m3_components/m3_button/m3_button_type_enum.dart';

/// A button with icon
/// Disable Button with [onPressed] = null
/// required [text] and [icon]
class M3ButtonWithIcon extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback? onPressed;
  final M3ButtonType _type;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Size? fixedSize;
  final bool? reverseIcon;

  const M3ButtonWithIcon({
    super.key,
    required this.text,
    required this.icon,
    this.backgroundColor,
    this.foregroundColor,
    this.fixedSize,
    this.onPressed,
    this.reverseIcon,
  }) : _type = M3ButtonType.normal;

  const M3ButtonWithIcon.filled({
    super.key,
    required this.text,
    required this.icon,
    this.reverseIcon,
    this.backgroundColor,
    this.fixedSize,
    this.foregroundColor,
    this.onPressed,
  }) : _type = M3ButtonType.filled;

  const M3ButtonWithIcon.filledTonal({
    super.key,
    required this.text,
    required this.icon,
    this.fixedSize,
    this.reverseIcon,
    this.backgroundColor,
    this.foregroundColor,
    this.onPressed,
  }) : _type = M3ButtonType.filledTonal;

  const M3ButtonWithIcon.outline({
    super.key,
    required this.text,
    required this.icon,
    this.reverseIcon,
    this.fixedSize,
    this.backgroundColor,
    this.foregroundColor,
    this.onPressed,
  }) : _type = M3ButtonType.outline;

  const M3ButtonWithIcon.text({
    super.key,
    required this.text,
    this.backgroundColor,
    this.foregroundColor,
    this.reverseIcon,
    this.fixedSize,
    required this.icon,
    this.onPressed,
  }) : _type = M3ButtonType.text;

  @override
  Widget build(BuildContext context) {
    final textDirection =
        reverseIcon ?? false ? TextDirection.rtl : TextDirection.ltr;

    final (
      backgroundColorCallBack,
      foregroundColorCallBack,
      elevationCallBack
    ) = _type.getPalette(colorScheme: Theme.of(context).colorScheme);

    return switch (_type) {
      M3ButtonType.text => Directionality(
          textDirection: textDirection,
          child: TextButton.icon(
              style: TextButton.styleFrom(
                  fixedSize: fixedSize,
                  foregroundColor: foregroundColor,
                  backgroundColor: backgroundColor),
              onPressed: onPressed,
              icon: Icon(icon),
              label: AutoSizeText(text)),
        ),
      M3ButtonType.outline => Directionality(
          textDirection: textDirection,
          child: OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                  fixedSize: fixedSize,
                  foregroundColor: foregroundColor,
                  backgroundColor: backgroundColor),
              onPressed: onPressed,
              icon: Icon(icon),
              label: AutoSizeText(text)),
        ),
      _ => Directionality(
          textDirection: textDirection,
          child: OutlinedButton.icon(
              onPressed: onPressed,
              icon: Icon(icon),
              label: AutoSizeText(text),
              style: ElevatedButton.styleFrom(
                      fixedSize: fixedSize,
                      foregroundColor:
                          foregroundColor ?? foregroundColorCallBack,
                      backgroundColor:
                          backgroundColor ?? backgroundColorCallBack)
                  .copyWith(elevation: elevationCallBack)),
        )
    };
  }
}
