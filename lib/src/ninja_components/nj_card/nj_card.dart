import 'package:flutter/material.dart';
import 'package:ninja_core/ninja_core.dart';

class NJCard extends StatelessWidget {
  final double? elevation;
  final Color? color;
  final Color? shadowColor;
  final Widget child;
  final double? width;
  final double? height;
  final NJEdgeInsets? njEdgeInsets;

  const NJCard(
      {Key? key,
      this.elevation,
      required this.child,
      this.color,
      this.shadowColor,
      this.width,
      this.height,
      this.njEdgeInsets})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Card(
        elevation: elevation ?? 4,
        color: color ?? Theme.of(context).colorScheme.surface,
        shadowColor: shadowColor ?? Theme.of(context).colorScheme.onSurface,
        child: NJPadding(
            padding: njEdgeInsets ?? const NJEdgeInsets.all(NJGapSize.regular),
            child: child),
      ),
    );
  }
}
