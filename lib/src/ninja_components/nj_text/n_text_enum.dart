import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum NJTextStyle {
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
  labelSmall,
}

class NjTextHelper {
  static getStyleByNJTextStyle(
      {required NJTextStyle njTextStyle, required BuildContext context}) {
    final textTheme = Theme.of(context)
        .textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);
    switch (njTextStyle) {
      case NJTextStyle.displayLarge:
        return textTheme.displayLarge;
      case NJTextStyle.displayMedium:
        return textTheme.displayMedium;
      case NJTextStyle.displaySmall:
        return textTheme.displaySmall;
      case NJTextStyle.headlineLarge:
        return textTheme.headlineLarge;
      case NJTextStyle.headlineMedium:
        return textTheme.headlineMedium;
      case NJTextStyle.headlineSmall:
        return textTheme.headlineSmall;
      case NJTextStyle.bodyLarge:
        return textTheme.bodyLarge;
      case NJTextStyle.bodyMedium:
        return textTheme.bodyMedium;
      case NJTextStyle.bodySmall:
        return textTheme.bodySmall;
      case NJTextStyle.titleLarge:
        return textTheme.titleLarge;
      case NJTextStyle.titleMedium:
        return textTheme.titleMedium;
      case NJTextStyle.titleSmall:
        return textTheme.titleSmall;
      case NJTextStyle.labelLarge:
        return textTheme.labelLarge;
      case NJTextStyle.labelMedium:
        return textTheme.labelMedium;
      case NJTextStyle.labelSmall:
        return textTheme.labelSmall;
    }
  }
}
