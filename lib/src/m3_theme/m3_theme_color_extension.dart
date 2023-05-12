import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:material_color_utilities/material_color_utilities.dart';

class M3ThemeColorExtension extends ThemeExtension<M3ThemeColorExtension> {
  const M3ThemeColorExtension({required this.danger});

  final Color? danger;

  @override
  M3ThemeColorExtension copyWith({Color? danger}) =>
      M3ThemeColorExtension(danger: danger ?? this.danger);

  @override
  M3ThemeColorExtension lerp(M3ThemeColorExtension? other, double t) {
    if (other is! ThemeExtension && other == null) {
      return this;
    }
    return M3ThemeColorExtension(danger: Color.lerp(danger, other!.danger, t));
  }
  
  M3ThemeColorExtension harmonized(ColorScheme dynamic) =>
      copyWith(danger: danger!.harmonizeWith(dynamic.primary));
}

/// Shifts color [from] towards color [to].
Color _harmonizeColor(Color from, Color to) {
  if (from == to) return from;
  return Color(Blend.harmonize(from.value, to.value));
}

extension ColorHarmonization on Color {
  Color harmonizeWith(Color color) => _harmonizeColor(this, color);
}
