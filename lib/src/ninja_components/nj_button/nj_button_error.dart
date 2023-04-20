import 'package:flutter/material.dart';
import 'package:ninja_core/src/ninja_components/nj_button/nj_button_helper.dart';
import 'package:ninja_core/src/ninja_components/nj_button/nj_button_type_enum.dart';
export 'nj_button_with_icon.dart';

/// NjButton is a button with text

class NJButtonError extends StatelessWidget {
  final String? text;
  final Widget? child;
  final VoidCallback? onPressed;
  final NjButtonType _type;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Size? fixedSize;
  final bool? isFlexible;

  const NJButtonError({
    super.key,
    this.text,
    this.child,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.fixedSize,
    this.isFlexible,
  })  : _type = NjButtonType.normal,
        assert(text != null || child != null,
            "\"text\" or \"child\" must not be null at the same time");

  const NJButtonError.filled({
    super.key,
    this.text,
    this.child,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.fixedSize,
    this.isFlexible,
  })  : _type = NjButtonType.filled,
        assert(text != null || child != null,
            "\"text\" or \"child\" must not be null at the same time");

  const NJButtonError.filledTonal({
    super.key,
    this.text,
    this.child,
    this.onPressed,
    this.fixedSize,
    this.backgroundColor,
    this.foregroundColor,
    this.isFlexible,
  })  : _type = NjButtonType.filledTonal,
        assert(text != null || child != null,
            "\"text\" or \"child\" must not be null at the same time");

  const NJButtonError.outline({
    super.key,
    this.text,
    this.fixedSize,
    this.child,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.isFlexible,
  })  : _type = NjButtonType.outline,
        assert(text != null || child != null,
            "\"text\" or \"child\" must not be null at the same time");

  const NJButtonError.text({
    super.key,
    this.text,
    this.child,
    this.fixedSize,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.isFlexible,
  })  : _type = NjButtonType.text,
        assert(text != null || child != null,
            "\"text\" or \"child\" must not be null at the same time");

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    final style = onPressed == null ? null : TextStyle(color: scheme.error);

    if (_type == NjButtonType.normal) {
      return ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              fixedSize: fixedSize,
              foregroundColor: foregroundColor,
              backgroundColor: backgroundColor),
          child: child ?? Text(text!, style: style));
    }

      if (_type == NjButtonType.text) {
      return TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
              fixedSize: fixedSize,
              foregroundColor: foregroundColor,
              backgroundColor: backgroundColor),
          child: child ?? Text(text!, style: style));
    }

    if (_type == NjButtonType.outline) {
      return OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
              fixedSize: fixedSize,
              side: onPressed == null
                  ? null
                  : BorderSide(width: 1.0, color: scheme.error),
              foregroundColor: foregroundColor,
              backgroundColor: backgroundColor),
          child: child ?? Text(text!, style: style));
    }
    final njButtonPalette =
        NJButtonPalette.getPalette(context, _type, isCancel: true);

    return OutlinedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: fixedSize,
          side: onPressed == null
              ? null
              : BorderSide(width: 1.0, color: scheme.error),
          foregroundColor: foregroundColor ?? njButtonPalette.foregroundColor,
          backgroundColor: backgroundColor ?? njButtonPalette.backgroundColor,
        ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
        child: child ??
            Text(text!,
                style: onPressed == null
                    ? null
                    : TextStyle(
                        color: foregroundColor ??
                            njButtonPalette.foregroundColor)));
  }
}
