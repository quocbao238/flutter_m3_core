import 'package:flutter/material.dart';

enum M3ProgressType {
  primary,
  surface,
  secondary,
  tertiary;

  Color getColor(ColorScheme colorScheme) => switch (this) {
        M3ProgressType.surface => colorScheme.onSurface,
        M3ProgressType.primary => colorScheme.primary,
        M3ProgressType.secondary => colorScheme.secondary,
        M3ProgressType.tertiary => colorScheme.tertiary,
      };
}
