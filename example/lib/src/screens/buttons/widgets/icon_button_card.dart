import 'package:flutter/material.dart';
import 'package:ninja_core/m3_theme_core.dart';

class IconButtonCard extends StatefulWidget {
  const IconButtonCard({super.key});

  @override
  State<IconButtonCard> createState() => _IconButtonCardState();
}

class _IconButtonCardState extends State<IconButtonCard> {
  bool isEnable = true;

  onChangeEnable() => setState(() => isEnable = !isEnable);

  @override
  Widget build(BuildContext context) {
    final Function()? onPressed = isEnable ? () {} : null;

    return M3Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          M3Text.titleLarge(
              text: 'M3 Icon Button',
              textAlign: TextAlign.start,
              color: Theme.of(context).colorScheme.primary),
          Wrap(
            spacing: M3Spacing.medium.size,
            runSpacing: M3Spacing.medium.size,
            children: [
              M3Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    M3IconButton(icon: Icons.settings, onPressed: onPressed),
                    M3Padding(
                      padding: const M3EdgeInsets.symmetric(
                          horizontal: M3Spacing.medium),
                      child: M3Text.titleSmall(
                          text: 'IconButton (normal)',
                          color: isEnable ? Colors.red : null),
                    ),
                  ],
                ),
              ),
              M3Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    M3IconButton.filled(
                        icon: Icons.settings, onPressed: onPressed),
                    M3Padding(
                        padding: const M3EdgeInsets.symmetric(
                            horizontal: M3Spacing.medium),
                        child: M3Text.titleSmall(
                            text: 'IconButton (filled)',
                            color: isEnable ? Colors.red : null)),
                  ],
                ),
              ),
              M3Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    M3IconButton.filledTonal(
                        icon: Icons.settings, onPressed: onPressed),
                    M3Padding(
                        padding: const M3EdgeInsets.symmetric(
                            horizontal: M3Spacing.medium),
                        child: M3Text.titleSmall(
                            text: 'IconButton (filledTonal)',
                            color: isEnable ? Colors.red : null)),
                  ],
                ),
              ),
              M3Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    M3IconButton.outlined(
                        icon: Icons.settings, onPressed: onPressed),
                    M3Padding(
                        padding: const M3EdgeInsets.symmetric(
                            horizontal: M3Spacing.medium),
                        child: M3Text.titleSmall(
                            text: 'IconButton (outlined)',
                            color: isEnable ? Colors.red : null)),
                  ],
                ),
              ),
              M3Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    M3IconButton.filledTertiary(
                        icon: Icons.settings, onPressed: onPressed),
                    M3Padding(
                      padding: const M3EdgeInsets.symmetric(
                          horizontal: M3Spacing.medium),
                      child: M3Text.titleSmall(
                        text: 'IconButton (filledTertiary)',
                        color: isEnable ? Colors.red : null,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const M3Space.medium(),
          M3Button.filled(
            onPressed: onChangeEnable,
            child: Text(isEnable ? 'Disable' : 'Enable'),
          ),
        ],
      ),
    );
  }
}
