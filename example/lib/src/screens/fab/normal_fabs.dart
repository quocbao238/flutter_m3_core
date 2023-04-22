import 'package:flutter/material.dart';
import 'package:ninja_core/ninja_core.dart';

class NormalFab extends StatefulWidget {
  const NormalFab({Key? key}) : super(key: key);

  @override
  State<NormalFab> createState() => _NormalFabState();
}

class _NormalFabState extends State<NormalFab> {
  bool isEnable = true;

  _onChangeEnable() => setState(() => isEnable = !isEnable);

  @override
  Widget build(BuildContext context) {
    void Function()? onPressed = isEnable ? () {} : null;
    return NJCard(
      width: 1280 / 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const NJText.titleMedium(text: 'FABs (56x56)'),
          const NJGap.medium(),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              Column(children: [
                NJFloatingActionButton.surface(
                  iconData: Icons.edit_rounded,
                  onPressed: onPressed,
                ),
                const NJPadding(
                    padding: NJEdgeInsets.only(top: NJGapSize.medium), child: NJText.bodyMedium(text: 'Surface'))
              ]),
              Column(children: [
                NJFloatingActionButton.primary(iconData: Icons.edit_rounded, onPressed: onPressed),
                const NJPadding(
                    padding: NJEdgeInsets.only(top: NJGapSize.medium), child: NJText.bodyMedium(text: 'Primary'))
              ]),
              Column(children: [
                NJFloatingActionButton.secondary(iconData: Icons.edit_rounded, onPressed: onPressed),
                const NJPadding(
                    padding: NJEdgeInsets.only(top: NJGapSize.medium), child: NJText.bodyMedium(text: 'Secondary'))
              ]),
              Column(children: [
                NJFloatingActionButton.tertiary(iconData: Icons.edit_rounded, onPressed: onPressed),
                const NJPadding(
                    padding: NJEdgeInsets.only(top: NJGapSize.medium), child: NJText.bodyMedium(text: 'Tertiary'))
              ]),
            ],
          ),
          const NJGap.small(),
          NJButton.outline(
            onPressed: _onChangeEnable,
            text: isEnable ? 'Disable' : 'Enable',
          )
        ],
      ),
    );
  }
}
