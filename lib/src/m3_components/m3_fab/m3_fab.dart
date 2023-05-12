import 'package:flutter/material.dart';
import 'package:ninja_core/src/m3_components/m3_fab/m3_fab_enum.dart';

enum M3FabSize { small, normal, large, extended }

final class M3FloatingActionButton extends StatelessWidget {
  final IconData iconData;
  final String? label;
  final VoidCallback? onPressed;
  final M3FabType _type;
  final M3FabSize m3FabSize;

  /// A floating action button that can be used to trigger an action.
  /// Default color is surface
  const M3FloatingActionButton.surface(
      {super.key,
      required this.iconData,
      this.label,
      this.onPressed,
      this.m3FabSize = M3FabSize.normal})
      : _type = M3FabType.surface;

  const M3FloatingActionButton.primary(
      {super.key,
      required this.iconData,
      this.label,
      this.onPressed,
      this.m3FabSize = M3FabSize.normal})
      : _type = M3FabType.primary;

  const M3FloatingActionButton.secondary(
      {super.key,
      required this.iconData,
      this.label,
      this.onPressed,
      this.m3FabSize = M3FabSize.normal})
      : _type = M3FabType.secondary;

  const M3FloatingActionButton.tertiary(
      {super.key,
      required this.iconData,
      this.label,
      this.onPressed,
      this.m3FabSize = M3FabSize.normal})
      : _type = M3FabType.tertiary;

  @override
  Widget build(BuildContext context) {
    if (label != null && m3FabSize != M3FabSize.extended) {
      throw Exception(
          'Label is only available for extended FABs. Please use NjFabSize.extended');
    }

    if (m3FabSize == M3FabSize.extended && label == null) {
      throw Exception('Label is required for extended FABs');
    }

    Color? backgroundColor;
    Color? foregroundColor;

    if (onPressed != null) {
      final (backgroundColorCallBack, foregroundColorCallback) =
          _type.getColor(Theme.of(context).colorScheme);
      backgroundColor = backgroundColorCallBack;
      foregroundColor = foregroundColorCallback;
    }

    return switch (m3FabSize) {
      M3FabSize.small => FloatingActionButton.small(
          onPressed: onPressed,
          backgroundColor: backgroundColor,
          heroTag: null,
          foregroundColor: foregroundColor,
          child: Icon(iconData),
        ),
      M3FabSize.large => FloatingActionButton.large(
          onPressed: onPressed,
          backgroundColor: backgroundColor,
          heroTag: null,
          foregroundColor: foregroundColor,
          child: Icon(iconData),
        ),
      M3FabSize.normal => FloatingActionButton(
          onPressed: onPressed,
          backgroundColor: backgroundColor,
          heroTag: null,
          foregroundColor: foregroundColor,
          child: Icon(iconData),
        ),
      M3FabSize.extended => FloatingActionButton.extended(
          onPressed: onPressed,
          backgroundColor: backgroundColor,
          heroTag: null,
          foregroundColor: foregroundColor,
          isExtended: true,
          icon: Icon(iconData),
          label: Text(label!)),
    };
  }
}
