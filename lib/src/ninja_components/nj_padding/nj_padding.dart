import 'package:flutter/material.dart';
import 'package:ninja_core/src/ninja_components/nj_gap/nj_gap_enum.dart';
import 'package:ninja_core/src/ninja_components/nj_padding/nj_edge_insets.dart';

export 'package:ninja_core/src/ninja_components/nj_padding/nj_edge_insets.dart';

class NJPadding extends StatelessWidget {
  final NJEdgeInsets? padding;
  final Widget child;

  const NJPadding({
    super.key,
    this.padding = const NJEdgeInsets.all(NJGapSize.none),
    required this.child,
  });

  const NJPadding.small({
    super.key,
    required this.child,
  }) : padding = const NJEdgeInsets.all(NJGapSize.small);

  const NJPadding.medium({
    super.key,
    required this.child,
  }) : padding = const NJEdgeInsets.all(NJGapSize.medium);

  const NJPadding.regular({
    super.key,
    required this.child,
  }) : padding = const NJEdgeInsets.all(NJGapSize.regular);

  const NJPadding.large({
    super.key,
    required this.child,
  }) : padding = const NJEdgeInsets.all(NJGapSize.large);

  const NJPadding.veryLarge({
    super.key,
    required this.child,
  }) : padding = const NJEdgeInsets.all(NJGapSize.veryLarge);

  @override
  Widget build(BuildContext context) =>
      Padding(padding: padding!.toEdgeInsets(), child: child);
}
