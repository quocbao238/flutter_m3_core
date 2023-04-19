import 'package:flutter/material.dart';
import 'package:ninja_core/src/ninja_components/nj_button/nj_button_helper.dart';
import 'package:ninja_core/src/ninja_components/nj_button/nj_button_type_enum.dart';

/// A button with icon
/// Disable Button with [onPressed] = null
/// required [text] and [icon]
class NjButtonWithIcon extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback? onPressed;
  final NjButtonType _type;

  const NjButtonWithIcon({
    super.key,
    required this.text,
    required this.icon,
    this.onPressed,
  }) : _type = NjButtonType.normal;

  const NjButtonWithIcon.filled({
    super.key,
    required this.text,
    required this.icon,
    this.onPressed,
  }) : _type = NjButtonType.filled;

  const NjButtonWithIcon.filledTonal({
    super.key,
    required this.text,
    required this.icon,
    this.onPressed,
  }) : _type = NjButtonType.filledTonal;

  const NjButtonWithIcon.outline({
    super.key,
    required this.text,
    required this.icon,
    this.onPressed,
  }) : _type = NjButtonType.outline;

  const NjButtonWithIcon.text({
    super.key,
    required this.text,
    required this.icon,
    this.onPressed,
  }) : _type = NjButtonType.text;

  @override
  Widget build(BuildContext context) {
    if (_type == NjButtonType.text) {
      return TextButton.icon(
          onPressed: onPressed, icon: Icon(icon), label: Text(text));
    }

    if (_type == NjButtonType.outline) {
      return OutlinedButton.icon(
          onPressed: onPressed, icon: Icon(icon), label: Text(text));
    }

    final njButtonPalette = NjButtonPalette.getPalette(context, _type);
    return OutlinedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(text),
        style: OutlinedButton.styleFrom(
                foregroundColor: njButtonPalette.foregroundColor,
                backgroundColor: njButtonPalette.backgroundColor)
            .copyWith(elevation: njButtonPalette.elevation));
  }
}
