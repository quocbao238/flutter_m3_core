import 'package:flutter/material.dart';
import 'package:ninja_core/src/ninja_components/nj_button/nj_button_helper.dart';
import 'package:ninja_core/src/ninja_components/nj_button/nj_button_type_enum.dart';
export 'nj_button_with_icon.dart';


class NjButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final NjButtonType _type;

  const NjButton({
    super.key,
    required this.text,
    this.onPressed,
  }) : _type = NjButtonType.normal;

  const NjButton.filled({
    super.key,
    required this.text,
    this.onPressed,
  }) : _type = NjButtonType.filled;

  const NjButton.filledTonal({
    super.key,
    required this.text,
    this.onPressed,
  }) : _type = NjButtonType.filledTonal;

  const NjButton.outline({
    super.key,
    required this.text,
    this.onPressed,
  }) : _type = NjButtonType.outline;

  const NjButton.text({
    super.key,
    required this.text,
    this.onPressed,
  }) : _type = NjButtonType.text;

  @override
  Widget build(BuildContext context) {
    if (_type == NjButtonType.text) {
      return TextButton(onPressed: onPressed, child: Text(text));
    }

    if (_type == NjButtonType.outline) {
      return OutlinedButton(onPressed: onPressed, child: Text(text));
    }

    final njButtonPalette = NjButtonPalette.getPalette(context, _type);
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
                foregroundColor: njButtonPalette.foregroundColor,
                backgroundColor: njButtonPalette.backgroundColor)
            .copyWith(elevation: njButtonPalette.elevation),
        child: Text(text));
  }
}
