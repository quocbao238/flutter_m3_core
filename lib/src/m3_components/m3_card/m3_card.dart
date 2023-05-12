import 'package:flutter/material.dart';
import 'package:ninja_core/m3_theme_core.dart';

class M3Card extends StatelessWidget {
  /// elevation: The z-coordinate at which to place this card.
  /// This controls the size of the shadow below the card.
  /// default: 4
  final double? elevation;
  final Color? color;
  final Color? shadowColor;
  final Widget child;
  final double? width;
  final double? height;
  final M3EdgeInsets? njEdgeInsets;

  const M3Card(
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
  Widget build(BuildContext context) => SizedBox(
        width: width,
        height: height,
        child: Card(
          elevation: elevation ?? 4,
          color: color ?? Theme.of(context).colorScheme.surface,
          shadowColor: shadowColor ?? Theme.of(context).colorScheme.onSurface,
          child: M3Padding(
              padding:
                  njEdgeInsets ?? const M3EdgeInsets.all(M3Spacing.regular),
              child: child),
        ),
      );
}
