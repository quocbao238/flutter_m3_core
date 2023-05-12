import 'package:flutter/material.dart';

enum NjIconButtonType {
  normal,
  filled,
  filledTonal,
  filledTertiary,
  outline;

  ButtonStyle? getIconButtonStyle(ColorScheme colorScheme,
      {bool isDisable = false}) {
    if (isDisable) return null;
    Map<String, Color?> colors = switch (this) {
      NjIconButtonType.filled => {
          'foregroundColor': colorScheme.onPrimary,
          'backgroundColor': colorScheme.primary,
          'disabledForegroundColor': colorScheme.onSurface.withOpacity(0.38),
          'disabledBackgroundColor': colorScheme.onSurface.withOpacity(0.12),
          'hoverColor': colorScheme.onPrimary.withOpacity(0.08),
          'focusColor': colorScheme.onPrimary.withOpacity(0.12),
          'highlightColor': colorScheme.onPrimary.withOpacity(0.12),
        },
      NjIconButtonType.filledTonal => {
          'foregroundColor': colorScheme.onSecondaryContainer,
          'backgroundColor': colorScheme.secondaryContainer,
          'disabledForegroundColor': colorScheme.onSurface.withOpacity(0.38),
          'disabledBackgroundColor': colorScheme.onSurface.withOpacity(0.12),
          'hoverColor': colorScheme.onSecondaryContainer.withOpacity(0.08),
          'focusColor': colorScheme.onSecondaryContainer.withOpacity(0.12),
          'highlightColor': colorScheme.onSecondaryContainer.withOpacity(0.12),
        },
      NjIconButtonType.filledTertiary => {
          'foregroundColor': colorScheme.onTertiary,
          'backgroundColor': colorScheme.tertiary,
          'disabledForegroundColor': colorScheme.onSurface.withOpacity(0.38),
          'disabledBackgroundColor': colorScheme.onSurface.withOpacity(0.12),
          'hoverColor': colorScheme.onTertiary.withOpacity(0.08),
          'focusColor': colorScheme.onTertiary.withOpacity(0.12),
          'highlightColor': colorScheme.onTertiary.withOpacity(0.12),
        },
      NjIconButtonType.outline => {
          'foregroundColor': colorScheme.onSurfaceVariant,
          'backgroundColor': colorScheme.surfaceVariant,
          'disabledForegroundColor': colorScheme.onSurface.withOpacity(0.38),
          'disabledBackgroundColor': colorScheme.onSurface.withOpacity(0.12),
          'hoverColor': colorScheme.surfaceVariant.withOpacity(0.08),
          'focusColor': colorScheme.surfaceVariant.withOpacity(0.12),
          'highlightColor': colorScheme.surfaceVariant.withOpacity(0.12),
        },
      NjIconButtonType.normal => {
          'foregroundColor': null,
          'backgroundColor': null,
          'disabledForegroundColor': null,
          'disabledBackgroundColor': null,
          'hoverColor': null,
          'focusColor': null,
          'highlightColor': null,
        }
    };

    return IconButton.styleFrom(
      foregroundColor: colors['foregroundColor'],
      backgroundColor: colors['backgroundColor'],
      disabledForegroundColor: colors['disabledForegroundColor'],
      disabledBackgroundColor: colors['disabledBackgroundColor'],
      hoverColor: colors['hoverColor'],
      focusColor: colors['focusColor'],
      highlightColor: colors['highlightColor'],
    ).copyWith(
      side: this == NjIconButtonType.outline
          ? MaterialStateProperty.all(BorderSide(color: colorScheme.outline))
          : null,
    );
  }
}
