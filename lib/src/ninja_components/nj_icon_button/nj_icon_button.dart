import 'package:flutter/material.dart';
import 'package:ninja_core/src/ninja_components/nj_icon_button/nj_icon_button_type.dart';

class NjIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final NjIconButtonType _type;

  const NjIconButton({super.key, required this.icon, this.onPressed}) : _type = NjIconButtonType.normal;

  const NjIconButton.filled({super.key, required this.icon, this.onPressed}) : _type = NjIconButtonType.filled;

  const NjIconButton.outlined({super.key, required this.icon, this.onPressed}) : _type = NjIconButtonType.outline;

  const NjIconButton.filledTonal({super.key, required this.icon, this.onPressed})
      : _type = NjIconButtonType.filledTonal;

  const NjIconButton.filledTertiary({super.key, required this.icon, this.onPressed})
      : _type = NjIconButtonType.filledTertiary;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final buttonStyle = getIconButtonStyle(_type, false, colorScheme);

    return IconButton(
        style: buttonStyle, onPressed: onPressed, visualDensity: VisualDensity.standard, icon: Icon(icon));
  }
}
