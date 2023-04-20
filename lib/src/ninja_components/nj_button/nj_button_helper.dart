import 'package:flutter/material.dart';
import 'package:ninja_core/src/ninja_components/nj_button/nj_button_type_enum.dart';

class NJButtonPalette {
  final Color? backgroundColor;
  final Color? foregroundColor;
  final MaterialStateProperty<double?>? elevation;

  NJButtonPalette({this.backgroundColor, this.foregroundColor, this.elevation});

  static NJButtonPalette getPalette(BuildContext ctx, NjButtonType njButtonType,
      {bool isCancel = false}) {
    Color? backgroundColor;
    Color? foregroundColor;
    MaterialStateProperty<double?>? elevation;
    final ColorScheme colorScheme = Theme.of(ctx).colorScheme;

    switch (njButtonType) {
      case NjButtonType.normal:
        if (!isCancel) break;
        // backgroundColor = colorScheme.error;
        foregroundColor = colorScheme.error;
        elevation = ButtonStyleButton.allOrNull(0.0);
        break;
      case NjButtonType.filled:
        backgroundColor = isCancel ? colorScheme.error : colorScheme.primary;
        foregroundColor =
            isCancel ? colorScheme.onError : colorScheme.onPrimary;
        elevation = ButtonStyleButton.allOrNull(0.0);
        break;
      case NjButtonType.filledTonal:
        backgroundColor = isCancel
            ? colorScheme.errorContainer
            : colorScheme.secondaryContainer;
        foregroundColor = isCancel
            ? colorScheme.onErrorContainer
            : colorScheme.onSecondaryContainer;
        elevation = ButtonStyleButton.allOrNull(0.0);
        break;
    }

    return NJButtonPalette(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        elevation: elevation);
  }
}

class NjButtonHelper {}
