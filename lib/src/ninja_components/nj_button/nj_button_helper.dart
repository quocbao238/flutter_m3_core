import 'package:flutter/material.dart';
import 'package:ninja_core/src/ninja_components/nj_button/nj_button_type_enum.dart';

class NjButtonPalette {
  final Color? backgroundColor;
  final Color? foregroundColor;
  final MaterialStateProperty<double?>? elevation;

  NjButtonPalette({this.backgroundColor, this.foregroundColor, this.elevation});

  static NjButtonPalette getPalette(BuildContext ctx, NjButtonType njButtonType) {
    Color? backgroundColor;
    Color? foregroundColor;
    MaterialStateProperty<double?>? elevation;

    switch (njButtonType) {
      case NjButtonType.filled:
        backgroundColor = Theme.of(ctx).colorScheme.primary;
        foregroundColor = Theme.of(ctx).colorScheme.onPrimary;
        elevation = ButtonStyleButton.allOrNull(0.0);
        break;
      case NjButtonType.filledTonal:
        backgroundColor = Theme.of(ctx).colorScheme.secondaryContainer;
        foregroundColor = Theme.of(ctx).colorScheme.onSecondaryContainer;
        elevation = ButtonStyleButton.allOrNull(0.0);
        break;
      case NjButtonType.normal:
        // TODO: Handle this case.
        break;
      case NjButtonType.outline:
        // TODO: Handle this case.
        break;
      case NjButtonType.text:
        // TODO: Handle this case.
        break;
    }

    return NjButtonPalette(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        elevation: elevation);
  }
}

class NjButtonHelper {}
