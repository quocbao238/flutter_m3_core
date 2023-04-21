import 'package:flutter/material.dart';
import 'package:ninja_core/src/ninja_components/nj_button/nj_button_helper.dart';
import 'package:ninja_core/src/ninja_components/nj_button/nj_button_type_enum.dart';
export 'nj_button_with_icon.dart';
export 'nj_button_error.dart';

/// NjButton is a button with text

class NJButton extends StatelessWidget {
  final String? text;
  final Widget? child;
  final VoidCallback? onPressed;
  final NjButtonType _type;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Size? fixedSize;

  const NJButton({
    super.key,
    this.text,
    this.child,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.fixedSize,
  })  : _type = NjButtonType.normal,
        assert(text != null || child != null,
            "\"text\" or \"child\" must not be null at the same time");

  const NJButton.filled({
    super.key,
    this.text,
    this.child,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.fixedSize,
  })  : _type = NjButtonType.filled,
        assert(text != null || child != null,
            "\"text\" or \"child\" must not be null at the same time");

  const NJButton.filledTonal({
    super.key,
    this.text,
    this.child,
    this.onPressed,
    this.fixedSize,
    this.backgroundColor,
    this.foregroundColor,
  })  : _type = NjButtonType.filledTonal,
        assert(text != null || child != null,
            "\"text\" or \"child\" must not be null at the same time");

  const NJButton.filledTertiary({
    super.key,
    this.text,
    this.child,
    this.onPressed,
    this.fixedSize,
    this.backgroundColor,
    this.foregroundColor,
  })  : _type = NjButtonType.filledTonal,
        assert(text != null || child != null,
            "\"text\" or \"child\" must not be null at the same time");

  const NJButton.outline({
    super.key,
    this.text,
    this.fixedSize,
    this.child,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
  })  : _type = NjButtonType.outline,
        assert(text != null || child != null,
            "\"text\" or \"child\" must not be null at the same time");

  const NJButton.text({
    super.key,
    this.text,
    this.child,
    this.fixedSize,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
  })  : _type = NjButtonType.text,
        assert(text != null || child != null,
            "\"text\" or \"child\" must not be null at the same time");

  @override
  Widget build(BuildContext context) {
    if (_type == NjButtonType.normal) {
      return ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              fixedSize: fixedSize,
              foregroundColor: foregroundColor,
              backgroundColor: backgroundColor),
          child: child ?? Text(text!));
    }

    if (_type == NjButtonType.text) {
      return TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
              fixedSize: fixedSize,
              foregroundColor: foregroundColor,
              backgroundColor: backgroundColor),
          child: child ?? Text(text!));
    }

    if (_type == NjButtonType.outline) {
      return OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
              fixedSize: fixedSize,
              foregroundColor: foregroundColor,
              backgroundColor: backgroundColor),
          child: child ?? Text(text!));
    }

    final njButtonPalette = NJButtonPalette.getPalette(context, _type);
    return OutlinedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
                fixedSize: fixedSize,
                foregroundColor:
                    foregroundColor ?? njButtonPalette.foregroundColor,
                backgroundColor:
                    backgroundColor ?? njButtonPalette.backgroundColor)
            .copyWith(elevation: njButtonPalette.elevation),
        child: child ?? Text(text!));
  }
}