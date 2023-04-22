import 'package:flutter/material.dart';
import 'package:ninja_core/src/ninja_components/nj_fab/fab_type.dart';

enum NjFabSize { small, normal, large, extended }

class NJFloatingActionButton extends StatelessWidget {
  final IconData iconData;
  final String? label;
  final VoidCallback? onPressed;
  final FABType _type;
  final NjFabSize njFabSize;

  /// A floating action button that can be used to trigger an action.
  /// Default color is surface
  const NJFloatingActionButton.surface(
      {super.key, required this.iconData, this.label, this.onPressed, this.njFabSize = NjFabSize.normal})
      : _type = FABType.surface;

  const NJFloatingActionButton.primary(
      {super.key, required this.iconData, this.label, this.onPressed, this.njFabSize = NjFabSize.normal})
      : _type = FABType.primary;

  const NJFloatingActionButton.secondary(
      {super.key, required this.iconData, this.label, this.onPressed, this.njFabSize = NjFabSize.normal})
      : _type = FABType.secondary;

  const NJFloatingActionButton.tertiary(
      {super.key, required this.iconData, this.label, this.onPressed, this.njFabSize = NjFabSize.normal})
      : _type = FABType.tertiary;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    Color? backgroundColor;
    Color? foregroundColor;

    if (label != null && njFabSize != NjFabSize.extended) {
      throw Exception('Label is only available for extended FABs. Please use NjFabSize.extended');
    }

    if (njFabSize == NjFabSize.extended && label == null) {
      throw Exception('Label is required for extended FABs');
    }

    if (onPressed != null) {
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
    }

    if (njFabSize == NjFabSize.small) {
      return FloatingActionButton.small(
        onPressed: onPressed,
        backgroundColor: backgroundColor,
        heroTag: null,
        foregroundColor: foregroundColor,
        child: Icon(iconData),
      );
    }

    if (njFabSize == NjFabSize.large) {
      return FloatingActionButton.large(
        onPressed: onPressed,
        backgroundColor: backgroundColor,
        heroTag: null,
        foregroundColor: foregroundColor,
        child: Icon(iconData),
      );
    }

    if (njFabSize == NjFabSize.normal) {
      return FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: backgroundColor,
        heroTag: null,
        foregroundColor: foregroundColor,
        child: Icon(iconData),
      );
    }
    return FloatingActionButton.extended(
        onPressed: onPressed,
        backgroundColor: backgroundColor,
        heroTag: null,
        foregroundColor: foregroundColor,
        isExtended: true,
        icon: Icon(iconData),
        label: Text(label!));
  }
}
