import 'package:flutter/material.dart';
import 'package:ninja_core/src/m3_components/m3_icon_button/m3_icon_button_type.dart';

final class M3IconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final M3IconButtonType _type;

  const M3IconButton({super.key, required this.icon, this.onPressed})
      : _type = M3IconButtonType.normal;

  const M3IconButton.filled({super.key, required this.icon, this.onPressed})
      : _type = M3IconButtonType.filled;

  const M3IconButton.outlined({super.key, required this.icon, this.onPressed})
      : _type = M3IconButtonType.outline;

  const M3IconButton.filledTonal(
      {super.key, required this.icon, this.onPressed})
      : _type = M3IconButtonType.filledTonal;

  const M3IconButton.filledTertiary(
      {super.key, required this.icon, this.onPressed})
      : _type = M3IconButtonType.filledTertiary;

  @override
  Widget build(BuildContext context) => IconButton(
      style: _type.getIconButtonStyle(Theme.of(context).colorScheme,
          isDisable: false),
      onPressed: onPressed,
      visualDensity: VisualDensity.standard,
      icon: Icon(icon));
}
