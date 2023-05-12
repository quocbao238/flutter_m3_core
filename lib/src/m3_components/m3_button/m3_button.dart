import 'package:flutter/material.dart';
import 'package:ninja_core/src/m3_components/m3_button/m3_button_type_enum.dart';

export 'm3_button_with_icon.dart';
export 'm3_button_error.dart';

/// NjButton is a button with text

class M3Button extends StatelessWidget {
  final String? text;
  final Widget? child;
  final VoidCallback? onPressed;
  final M3ButtonType _type;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Size? fixedSize;

  const M3Button({
    super.key,
    this.text,
    this.child,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.fixedSize,
  })  : _type = M3ButtonType.normal,
        assert(text != null || child != null,
            "\"text\" or \"child\" must not be null at the same time");

  const M3Button.filled({
    super.key,
    this.text,
    this.child,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.fixedSize,
  })  : _type = M3ButtonType.filled,
        assert(text != null || child != null,
            "\"text\" or \"child\" must not be null at the same time");

  const M3Button.filledTonal({
    super.key,
    this.text,
    this.child,
    this.onPressed,
    this.fixedSize,
    this.backgroundColor,
    this.foregroundColor,
  })  : _type = M3ButtonType.filledTonal,
        assert(text != null || child != null,
            "\"text\" or \"child\" must not be null at the same time");

  const M3Button.filledTertiary({
    super.key,
    this.text,
    this.child,
    this.onPressed,
    this.fixedSize,
    this.backgroundColor,
    this.foregroundColor,
  })  : _type = M3ButtonType.filledTonal,
        assert(text != null || child != null,
            "\"text\" or \"child\" must not be null at the same time");

  const M3Button.outline({
    super.key,
    this.text,
    this.fixedSize,
    this.child,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
  })  : _type = M3ButtonType.outline,
        assert(text != null || child != null,
            "\"text\" or \"child\" must not be null at the same time");

  const M3Button.text({
    super.key,
    this.text,
    this.child,
    this.fixedSize,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
  })  : _type = M3ButtonType.text,
        assert(text != null || child != null,
            "\"text\" or \"child\" must not be null at the same time");

  @override
  Widget build(BuildContext context) {
    final (
      backgroundColorCallBack,
      foregroundColorCallBack,
      elevationCallBack
    ) = _type.getPalette(colorScheme: Theme.of(context).colorScheme);

    return switch (_type) {
      M3ButtonType.normal => ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              fixedSize: fixedSize,
              foregroundColor: foregroundColor,
              backgroundColor: backgroundColor),
          child: child ?? Text(text!)),
      M3ButtonType.text => TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
              fixedSize: fixedSize,
              foregroundColor: foregroundColor,
              backgroundColor: backgroundColor),
          child: child ?? Text(text!)),
      M3ButtonType.outline => OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
              fixedSize: fixedSize,
              foregroundColor: foregroundColor,
              backgroundColor: backgroundColor),
          child: child ?? Text(text!)),
      _ => OutlinedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
                  fixedSize: fixedSize,
                  foregroundColor: foregroundColor ?? foregroundColorCallBack,
                  backgroundColor: backgroundColor ?? backgroundColorCallBack)
              .copyWith(elevation: elevationCallBack),
          child: child ?? Text(text!))
    };
  }
}
