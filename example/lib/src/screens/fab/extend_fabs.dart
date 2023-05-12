import 'package:flutter/material.dart';
import 'package:ninja_core/m3_theme_core.dart';

class ExtendFab extends StatefulWidget {
  const ExtendFab({Key? key}) : super(key: key);

  @override
  State<ExtendFab> createState() => _ExtendFabState();
}

class _ExtendFabState extends State<ExtendFab> {
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
          const M3Text.titleMedium(text: 'Extended FABs'),
          const M3Space.medium(),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              Column(children: [
                M3FloatingActionButton.surface(
                    label: 'Label',
                    iconData: Icons.edit_rounded,
                    onPressed: onPressed,
                    m3FabSize: M3FabSize.extended),
                const M3Padding(
                    padding: M3EdgeInsets.only(top: M3Spacing.medium),
                    child: M3Text.bodyMedium(text: 'Surface'))
              ]),
              Column(children: [
                M3FloatingActionButton.primary(
                    label: 'Label',
                    iconData: Icons.edit_rounded,
                    onPressed: onPressed,
                    m3FabSize: M3FabSize.extended),
                const M3Padding(
                    padding: M3EdgeInsets.only(top: M3Spacing.medium),
                    child: M3Text.bodyMedium(text: 'Primary'))
              ]),
              Column(children: [
                M3FloatingActionButton.secondary(
                    label: 'Label',
                    iconData: Icons.edit_rounded,
                    onPressed: onPressed,
                    m3FabSize: M3FabSize.extended),
                const M3Padding(
                    padding: M3EdgeInsets.only(top: M3Spacing.medium),
                    child: M3Text.bodyMedium(text: 'Secondary'))
              ]),
              Column(children: [
                M3FloatingActionButton.tertiary(
                    label: 'Label',
                    iconData: Icons.edit_rounded,
                    onPressed: onPressed,
                    m3FabSize: M3FabSize.extended),
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
