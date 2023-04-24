import 'package:flutter/material.dart';

enum NjIconButtonType { normal, filled, filledTonal, filledTertiary, outline }

ButtonStyle? getIconButtonStyle(NjIconButtonType type, bool isDisable, ColorScheme colorScheme) {
  Color? foregroundColor;
  Color? backgroundColor;
  Color? disabledForegroundColor;
  Color? disabledBackgroundColor;
  Color? hoverColor;
  Color? focusColor;
  Color? highlightColor;

  if (isDisable) return null;

  if (type == NjIconButtonType.filled) {
    foregroundColor = colorScheme.onPrimary;
    backgroundColor = colorScheme.primary;
    disabledForegroundColor = colorScheme.onSurface.withOpacity(0.38);
    disabledBackgroundColor = colorScheme.onSurface.withOpacity(0.12);
    hoverColor = colorScheme.onPrimary.withOpacity(0.08);
    focusColor = colorScheme.onPrimary.withOpacity(0.12);
    highlightColor = colorScheme.onPrimary.withOpacity(0.12);
  }

  if (type == NjIconButtonType.filledTonal) {
    foregroundColor = colorScheme.onSecondaryContainer;
    backgroundColor = colorScheme.secondaryContainer;
    disabledForegroundColor = colorScheme.onSurface.withOpacity(0.38);
    disabledBackgroundColor = colorScheme.onSurface.withOpacity(0.12);
    hoverColor = colorScheme.onSecondaryContainer.withOpacity(0.08);
    focusColor = colorScheme.onSecondaryContainer.withOpacity(0.12);
    highlightColor = colorScheme.onSecondaryContainer.withOpacity(0.12);
  }

  if (type == NjIconButtonType.filledTertiary) {
    foregroundColor = colorScheme.onTertiary;
    backgroundColor = colorScheme.tertiary;
    disabledForegroundColor = colorScheme.onSurface.withOpacity(0.38);
    disabledBackgroundColor = colorScheme.onSurface.withOpacity(0.12);
    hoverColor = colorScheme.onTertiary.withOpacity(0.08);
    focusColor = colorScheme.onTertiary.withOpacity(0.12);
    highlightColor = colorScheme.onTertiary.withOpacity(0.12);
  }

  if (type == NjIconButtonType.outline) {
    foregroundColor = colorScheme.onSurfaceVariant;
    backgroundColor = colorScheme.surfaceVariant;
    disabledForegroundColor = colorScheme.onSurface.withOpacity(0.38);
    disabledBackgroundColor = colorScheme.onSurface.withOpacity(0.12);
    hoverColor = colorScheme.onSurfaceVariant.withOpacity(0.08);
    focusColor = colorScheme.onSurfaceVariant.withOpacity(0.12);
    highlightColor = colorScheme.onSurfaceVariant.withOpacity(0.12);
  }

  return IconButton.styleFrom(
    foregroundColor: foregroundColor,
    backgroundColor: backgroundColor,
    disabledForegroundColor: disabledForegroundColor,
    disabledBackgroundColor: disabledBackgroundColor,
    hoverColor: hoverColor,
    focusColor: focusColor,
    highlightColor: highlightColor,
  ).copyWith(
    side: type == NjIconButtonType.outline ? MaterialStateProperty.all(BorderSide(color: colorScheme.outline)) : null,
  );
}
