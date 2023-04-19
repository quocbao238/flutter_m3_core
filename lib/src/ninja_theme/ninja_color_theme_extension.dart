import 'package:flutter/material.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

class NinjaThemeColorExtension
    extends ThemeExtension<NinjaThemeColorExtension> {
  const NinjaThemeColorExtension({
    required this.danger,
  });

  final Color? danger;

  @override
  NinjaThemeColorExtension copyWith({Color? danger}) =>
      NinjaThemeColorExtension(danger: danger ?? this.danger);

  @override
  NinjaThemeColorExtension lerp(NinjaThemeColorExtension? other, double t) {
    if (other is! ThemeExtension && other == null) {
      return this;
    }

    return NinjaThemeColorExtension(
      danger: Color.lerp(danger, other!.danger, t),
    );
  }

  NinjaThemeColorExtension harmonized(ColorScheme dynamic) {
    return copyWith(danger: danger!.harmonizeWith(dynamic.primary));
  }
}


/// Shifts color [from] towards color [to].
Color _harmonizeColor(Color from, Color to) {
  if (from == to) return from;
  return Color(Blend.harmonize(from.value, to.value));
}


extension ColorHarmonization on Color {
  Color harmonizeWith(Color color) => _harmonizeColor(this, color);
}
