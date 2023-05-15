import 'package:flutter/material.dart';
import 'package:ninja_core/src/m3_components/m3_slider/m3_slider_enum.dart';

class M3Slider extends StatelessWidget {
  final double value;
  final double min;
  final double max;
  final Function(double)? onChanged;
  final M3SliderType _type;

  const M3Slider(
      {super.key,
      required this.value,
      this.min = 0.0,
      this.max = 1.0,
      required this.onChanged})
      : _type = M3SliderType.surface;

  const M3Slider.primary(
      {super.key,
      required this.value,
      this.min = 0.0,
      this.max = 1.0,
      required this.onChanged})
      : _type = M3SliderType.primary;

  const M3Slider.secondary(
      {super.key,
      required this.value,
      this.min = 0.0,
      this.max = 1.0,
      required this.onChanged})
      : _type = M3SliderType.secondary;

  const M3Slider.tertiary(
      {super.key,
      required this.value,
      this.min = 0.0,
      this.max = 1.0,
      required this.onChanged})
      : _type = M3SliderType.tertiary;

  @override
  Widget build(BuildContext context) {
    final color = _type.getColor(Theme.of(context).colorScheme);
    return Slider(
        value: value,
        onChanged: onChanged,
        thumbColor: color,
        activeColor: color,
        min: min,
        max: max);
  }
}
