import 'package:flutter/material.dart';

enum M3TextStyle {
  displayLarge,
  displayMedium,
  displaySmall,
  headlineLarge,
  headlineMedium,
  headlineSmall,
  bodyLarge,
  bodyMedium,
  bodySmall,
  titleLarge,
  titleMedium,
  titleSmall,
  labelLarge,
  labelMedium,
  labelSmall;

  TextStyle getTextStyle(BuildContext context) {
    final textTheme = Theme.of(context)
        .textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);
    return switch (this) {
          M3TextStyle.displayLarge => textTheme.displayLarge,
          M3TextStyle.displayMedium => textTheme.displayMedium,
          M3TextStyle.displaySmall => textTheme.displaySmall,
          M3TextStyle.headlineLarge => textTheme.headlineLarge,
          M3TextStyle.headlineMedium => textTheme.headlineMedium,
          M3TextStyle.headlineSmall => textTheme.headlineSmall,
          M3TextStyle.bodyLarge => textTheme.bodyLarge,
          M3TextStyle.bodyMedium => textTheme.bodyMedium,
          M3TextStyle.bodySmall => textTheme.bodySmall,
          M3TextStyle.titleLarge => textTheme.titleLarge,
          M3TextStyle.titleMedium => textTheme.titleMedium,
          M3TextStyle.titleSmall => textTheme.titleSmall,
          M3TextStyle.labelLarge => textTheme.labelLarge,
          M3TextStyle.labelMedium => textTheme.labelMedium,
          M3TextStyle.labelSmall => textTheme.labelSmall,
        } ??
        const TextStyle();
  }
}
