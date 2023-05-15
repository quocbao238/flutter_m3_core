import 'package:flutter/material.dart';

enum M3SliderType {
  primary,
  surface,
  secondary,
  tertiary;

  Color getColor(ColorScheme colorScheme) => switch (this) {
        M3SliderType.surface => colorScheme.surface,
        M3SliderType.primary => colorScheme.primary,
        M3SliderType.secondary => colorScheme.secondary,
        M3SliderType.tertiary => colorScheme.tertiary,
      };
}
