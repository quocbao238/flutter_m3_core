import 'package:flutter/material.dart';
import 'package:ninja_core/m3_theme_core.dart';

class SmallFab extends StatefulWidget {
  const SmallFab({Key? key}) : super(key: key);

  @override
  State<SmallFab> createState() => _SmallFabState();
}

class _SmallFabState extends State<SmallFab> {
  bool isEnable = true;

  _onChangeEnable() => setState(() => isEnable = !isEnable);

  @override
  Widget build(BuildContext context) {
    void Function()? onPressed = isEnable ? () {} : null;
    return M3Card(
      width: 1280 / 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const M3Text.titleMedium(text: 'Small FAB (40x40)'),
          const M3Space.medium(),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              Column(children: [
                M3FloatingActionButton.surface(
                  iconData: Icons.edit_rounded,
                  onPressed: onPressed,
                  m3FabSize: M3FabSize.small,
                ),
                const M3Padding(
                    padding: M3EdgeInsets.only(top: M3Spacing.medium),
                    child: M3Text.bodyMedium(text: 'Surface'))
              ]),
              Column(children: [
                M3FloatingActionButton.primary(
                  iconData: Icons.edit_rounded,
                  onPressed: onPressed,
                  m3FabSize: M3FabSize.small,
                ),
                const M3Padding(
                    padding: M3EdgeInsets.only(top: M3Spacing.medium),
                    child: M3Text.bodyMedium(text: 'Primary'))
              ]),
              Column(children: [
                M3FloatingActionButton.secondary(
                  iconData: Icons.edit_rounded,
                  onPressed: onPressed,
                  m3FabSize: M3FabSize.small,
                ),
                const M3Padding(
                    padding: M3EdgeInsets.only(top: M3Spacing.medium),
                    child: M3Text.bodyMedium(text: 'Secondary'))
              ]),
              Column(children: [
                M3FloatingActionButton.tertiary(
                  iconData: Icons.edit_rounded,
                  onPressed: onPressed,
                  m3FabSize: M3FabSize.small,
                ),
                const M3Padding(
                    padding: M3EdgeInsets.only(top: M3Spacing.medium),
                    child: M3Text.bodyMedium(text: 'Tertiary'))
              ]),
            ],
          ),
          const M3Space.small(),
          M3Button.outline(
            onPressed: _onChangeEnable,
            text: isEnable ? 'Disable' : 'Enable',
          )
        ],
      ),
    );
  }
}
