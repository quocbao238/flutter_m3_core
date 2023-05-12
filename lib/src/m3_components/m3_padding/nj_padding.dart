import 'package:flutter/material.dart';
import 'package:ninja_core/src/m3_components/m3_spacing/m3_spacing_enum.dart';
import 'package:ninja_core/src/m3_components/m3_padding/m3_edge_insets.dart';

export 'package:ninja_core/src/m3_components/m3_padding/m3_edge_insets.dart';

class M3Padding extends StatelessWidget {
  final M3EdgeInsets? padding;
  final Widget child;

  const M3Padding(
      {super.key,
      this.padding = const M3EdgeInsets.all(M3Spacing.none),
      required this.child});

  const M3Padding.small({super.key, required this.child})
      : padding = const M3EdgeInsets.all(M3Spacing.small);

  const M3Padding.medium({super.key, required this.child})
      : padding = const M3EdgeInsets.all(M3Spacing.medium);

  const M3Padding.regular({super.key, required this.child})
      : padding = const M3EdgeInsets.all(M3Spacing.regular);

  const M3Padding.large({super.key, required this.child})
      : padding = const M3EdgeInsets.all(M3Spacing.large);

  const M3Padding.veryLarge({super.key, required this.child})
      : padding = const M3EdgeInsets.all(M3Spacing.veryLarge);

  @override
  Widget build(BuildContext context) =>
      Padding(padding: padding!.toEdgeInsets(), child: child);
}
