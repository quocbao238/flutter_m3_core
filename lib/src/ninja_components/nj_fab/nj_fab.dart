import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:ninja_core/src/ninja_components/nj_fab/fab_type.dart';

class NJFloatingActionButton extends StatelessWidget {
  final IconData iconData;
  final String? label;
  final VoidCallback? onPressed;
  final FABType _type;

  /// A floating action button that can be used to trigger an action.
  /// Default color is surface
  const NJFloatingActionButton.surface({super.key, required this.iconData, this.label, this.onPressed})
      : _type = FABType.surface;

  const NJFloatingActionButton.primary({super.key, required this.iconData, this.label, this.onPressed})
      : _type = FABType.primary;

  const NJFloatingActionButton.secondary({super.key, required this.iconData, this.label, this.onPressed})
      : _type = FABType.secondary;

  const NJFloatingActionButton.tertiary({super.key, required this.iconData, this.label, this.onPressed})
      : _type = FABType.tertiary;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    Color? backgroundColor;
    Color? foregroundColor;

    switch (_type) {
      case FABType.surface:
        foregroundColor = scheme.onSurface;
        backgroundColor = scheme.surface;
        break;
      case FABType.primary:
        foregroundColor = scheme.onPrimary;
        backgroundColor = scheme.primary;
        break;
      case FABType.secondary:
        foregroundColor = scheme.onSecondary;
        backgroundColor = scheme.secondary;
        break;
      case FABType.tertiary:
        foregroundColor = scheme.onTertiary;
        backgroundColor = scheme.tertiary;
        break;
    }

    return FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(iconData),
            if (label != null) Text(label!),
          ],
        ));
  }
}
