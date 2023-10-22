import 'package:flutter/material.dart';

enum M3FabType {
  surface,
  primary,
  secondary,
  tertiary;

  (Color backgroundColor, Color foregroundColor) getColor(ColorScheme colorScheme) => switch (this) {
        M3FabType.surface => (colorScheme.surface, colorScheme.onSurface),
        M3FabType.primary => (colorScheme.primary, colorScheme.onPrimary),
        M3FabType.secondary => (colorScheme.secondary, colorScheme.onSecondary),
        M3FabType.tertiary => (colorScheme.tertiary, colorScheme.onTertiary),
      };
}
