import 'package:flutter/material.dart';
import 'package:ninja_core/src/m3_components/m3_button/m3_button_type_enum.dart';
export 'm3_button_with_icon.dart';

/// NjButton is a button with text

base class M3ButtonError extends StatelessWidget {
  final String? text;
  final Widget? child;
  final VoidCallback? onPressed;
  final M3ButtonType _type;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Size? fixedSize;
  final bool? isFlexible;

  const M3ButtonError({
    super.key,
    this.text,
    this.child,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.fixedSize,
    this.isFlexible,
  })  : _type = M3ButtonType.normal,
        assert(text != null || child != null,
            "\"text\" or \"child\" must not be null at the same time");

  const M3ButtonError.filled({
    super.key,
    this.text,
    this.child,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.fixedSize,
    this.isFlexible,
  })  : _type = M3ButtonType.filled,
        assert(text != null || child != null,
            "\"text\" or \"child\" must not be null at the same time");

  const M3ButtonError.filledTonal({
    super.key,
    this.text,
    this.child,
    this.onPressed,
    this.fixedSize,
    this.backgroundColor,
    this.foregroundColor,
    this.isFlexible,
  })  : _type = M3ButtonType.filledTonal,
        assert(text != null || child != null,
            "\"text\" or \"child\" must not be null at the same time");

  const M3ButtonError.outline({
    super.key,
    this.text,
    this.fixedSize,
    this.child,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.isFlexible,
  })  : _type = M3ButtonType.outline,
        assert(text != null || child != null,
            "\"text\" or \"child\" must not be null at the same time");

  const M3ButtonError.text({
    super.key,
    this.text,
    this.child,
    this.fixedSize,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.isFlexible,
  })  : _type = M3ButtonType.text,
        assert(text != null || child != null,
            "\"text\" or \"child\" must not be null at the same time");

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final style = onPressed == null ? null : TextStyle(color: scheme.error);
    final (backgroundColorCallBack, foregroundColorCallBack, _) =
        _type.getPalette(
      colorScheme: Theme.of(context).colorScheme,
      isCancel: true,
    );

    return switch (_type) {
      M3ButtonType.normal => ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              fixedSize: fixedSize,
              foregroundColor: foregroundColor,
              backgroundColor: backgroundColor),
          child: child ?? Text(text!, style: style),
        ),
      M3ButtonType.text => TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
              fixedSize: fixedSize,
              foregroundColor: foregroundColor,
              backgroundColor: backgroundColor),
          child: child ?? Text(text!, style: style),
        ),
      M3ButtonType.outline => OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
              fixedSize: fixedSize,
              side: onPressed == null
                  ? null
                  : BorderSide(width: 1.0, color: scheme.error),
              foregroundColor: foregroundColor,
              backgroundColor: backgroundColor),
          child: child ?? Text(text!, style: style),
        ),
      _ => OutlinedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            fixedSize: fixedSize,
            side: onPressed == null
                ? null
                : BorderSide(width: 1.0, color: scheme.error),
            foregroundColor: foregroundColor ?? foregroundColorCallBack,
            backgroundColor: backgroundColor ?? backgroundColorCallBack,
          ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
          child: child ??
              Text(text!,
                  style: onPressed == null
                      ? null
                      : TextStyle(
                          color: foregroundColor ?? foregroundColorCallBack)))
    };
  }
}
