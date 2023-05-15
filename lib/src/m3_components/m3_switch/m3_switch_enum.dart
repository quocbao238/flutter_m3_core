import 'package:flutter/material.dart';

enum M3SwitchType {
  normal,
  primary,
  tertiary,
  adaptive;

  MaterialStateProperty<Color?>? thumbColor(ColorScheme colorScheme) {
    final (Color? normalColor, Color? selectedColor) = switch (this) {
      M3SwitchType.primary => (
          colorScheme.onPrimaryContainer,
          colorScheme.onPrimary
        ),
      M3SwitchType.tertiary => (
          colorScheme.onTertiaryContainer,
          colorScheme.onTertiary
        ),
      _ => (null, null)
    };
    if (normalColor == null || selectedColor == null) return null;
    return MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
      if (states.contains(MaterialState.disabled)) {
        return normalColor.withOpacity(0.5);
      }
      if (states.contains(MaterialState.selected)) {
        return selectedColor;
      }
      return normalColor;
    });
  }

  MaterialStateProperty<Icon?>? thumbIcon(
      {IconData? normalIcon, IconData? selectedIcon}) {
    if (normalIcon == null && selectedIcon == null) return null;

    return MaterialStateProperty.resolveWith<Icon?>(
        (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return Icon(selectedIcon);
      }
      return normalIcon != null ? Icon(normalIcon) : null; // All oth
    });
  }
}
