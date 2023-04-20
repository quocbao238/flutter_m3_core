import 'package:flutter/material.dart';

class NJDivider extends StatelessWidget {
  final Axis? axis;
  final Color? color;
  final double? thickness;

  const NJDivider({super.key, this.axis, this.color, this.thickness});

  @override
  Widget build(BuildContext context) {
    final m3color = color ?? Theme.of(context).dividerColor;
    final m3thickness = thickness ?? 1;

    return Divider(color: m3color, thickness: m3thickness);
  }
}
