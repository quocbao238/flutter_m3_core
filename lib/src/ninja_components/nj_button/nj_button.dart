import 'package:flutter/material.dart';
import 'package:ninja_core/src/ninja_components/nj_button/nj_button_helper.dart';
import 'package:ninja_core/src/ninja_components/nj_button/nj_button_type_enum.dart';
export 'nj_button_with_icon.dart';

/// NjButton is a button with text
/// Disable Button with [onPressed] = null
/// required [text] or [child]
/// [text] and [child] can not be null at the same time
/// [fixedSize] is the size of the button
/// [backgroundColor] is the background color of the button
/// [foregroundColor] is the foreground color of the button
/// [NjButtonType] is the type of the button
/// [NjButtonType.normal] is the default type of the button
/// [NjButtonType.filled] is the filled type of the button
/// [NjButtonType.filledTonal] is the filled tonal type of the button
/// [NjButtonType.outline] is the outline type of the button
/// [NjButtonType.text] is the text type of the button
class NjButton extends StatelessWidget {
  final String? text;
  final Widget? child;
  final VoidCallback? onPressed;
  final NjButtonType _type;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Size? fixedSize;

  const NjButton({
    super.key,
    this.text,
    this.child,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.fixedSize,
  })  : _type = NjButtonType.normal,
        assert(text != null || child != null, "\"text\" or \"child\" must not be null at the same time");

  const NjButton.filled({
    super.key,
    this.text,
    this.child,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.fixedSize,
  })  : _type = NjButtonType.filled,
        assert(text != null || child != null, "\"text\" or \"child\" must not be null at the same time");

  const NjButton.filledTonal({
    super.key,
    this.text,
    this.child,
    this.onPressed,
    this.fixedSize,
    this.backgroundColor,
    this.foregroundColor,
  })  : _type = NjButtonType.filledTonal,
        assert(text != null || child != null, "\"text\" or \"child\" must not be null at the same time");

  const NjButton.outline({
    super.key,
    this.text,
    this.fixedSize,
    this.child,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
  })  : _type = NjButtonType.outline,
        assert(text != null || child != null, "\"text\" or \"child\" must not be null at the same time");

  const NjButton.text({
    super.key,
    this.text,
    this.child,
    this.fixedSize,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
  })  : _type = NjButtonType.text,
        assert(text != null || child != null, "\"text\" or \"child\" must not be null at the same time");

  @override
  Widget build(BuildContext context) {
    if (_type == NjButtonType.text) {
      return TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
              fixedSize: fixedSize, foregroundColor: foregroundColor, backgroundColor: backgroundColor),
          child: child ?? Text(text!));
    }

    if (_type == NjButtonType.outline) {
      return OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
              fixedSize: fixedSize, foregroundColor: foregroundColor, backgroundColor: backgroundColor),
          child: child ?? Text(text!));
    }

    final njButtonPalette = NjButtonPalette.getPalette(context, _type);
    return OutlinedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
                fixedSize: fixedSize,
                foregroundColor: foregroundColor ?? njButtonPalette.foregroundColor,
                backgroundColor: foregroundColor ?? njButtonPalette.backgroundColor)
            .copyWith(elevation: njButtonPalette.elevation),
        child: child ?? Text(text!));
  }
}
