import 'package:flutter/material.dart';

enum M3ButtonType {
  normal,
  filled,
  filledTonal,
  outline,
  text;

  (
    Color? backgroundColor,
    Color? foregroundColor,
    MaterialStateProperty<double?>? elevation
  ) getPalette({required ColorScheme colorScheme, bool isCancel = false}) {
    Color? backgroundColor;
    Color? foregroundColor; 
    MaterialStateProperty<double?>? elevation;
    switch (this) {
      case M3ButtonType.normal:
        if (!isCancel) break;
        foregroundColor = colorScheme.error;
        elevation = ButtonStyleButton.allOrNull(0.0);
        break;
      case M3ButtonType.filled:
        backgroundColor = isCancel ? colorScheme.error : colorScheme.primary;
        foregroundColor =
            isCancel ? colorScheme.onError : colorScheme.onPrimary;
        elevation = ButtonStyleButton.allOrNull(0.0);
        break;
      case M3ButtonType.filledTonal:
        backgroundColor = isCancel
            ? colorScheme.errorContainer
            : colorScheme.secondaryContainer;
        foregroundColor = isCancel
            ? colorScheme.onErrorContainer
            : colorScheme.onSecondaryContainer;
        elevation = ButtonStyleButton.allOrNull(0.0);
        break;
      default:
    }
    return (backgroundColor, foregroundColor, elevation);
  }
}
