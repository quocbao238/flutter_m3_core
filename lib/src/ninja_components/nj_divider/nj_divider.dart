import 'package:flutter/material.dart';
import 'package:ninja_core/ninja_core.dart';

class NJDivider extends StatelessWidget {
  final Axis? axis;
  final Color? color;
  final double? thickness;
  final NJEdgeInsets? njPadding;

  const NJDivider({super.key, this.axis, this.color, this.thickness, this.njPadding});

  @override
  Widget build(BuildContext context) {
    final m3color = color ?? Theme.of(context).dividerColor;
    final m3thickness = thickness ?? 1;

    return NJPadding(
        padding: njPadding ?? const NJEdgeInsets.none(), child: Divider(color: m3color, thickness: m3thickness));
  }
}
