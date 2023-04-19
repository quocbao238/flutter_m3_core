import 'package:flutter/material.dart';
import 'package:ninja_core/src/ninja_components/nj_gap/nj_gap_enum.dart';
import 'package:ninja_core/src/ninja_components/nj_padding/nj_edge_insets.dart';

class NjPadding extends StatelessWidget {
  final NjEdgeInsets? padding;
  final Widget child;

  const NjPadding({
    super.key,
    this.padding = const NjEdgeInsets.all(NjGapSize.none),
    required this.child,
  });

  const NjPadding.small({
    super.key,
    required this.child,
  }) : padding = const NjEdgeInsets.all(NjGapSize.small);

  const NjPadding.medium({
    super.key,
    required this.child,
  }) : padding = const NjEdgeInsets.all(NjGapSize.medium);

  const NjPadding.regular({
    super.key,
    required this.child,
  }) : padding = const NjEdgeInsets.all(NjGapSize.regular);

  const NjPadding.large({
    super.key,
    required this.child,
  }) : padding = const NjEdgeInsets.all(NjGapSize.large);

  const NjPadding.veryLarge({
    super.key,
    required this.child,
  }) : padding = const NjEdgeInsets.all(NjGapSize.veryLarge);

  @override
  Widget build(BuildContext context) =>
      Padding(padding: padding!.toEdgeInsets(), child: child);
}
