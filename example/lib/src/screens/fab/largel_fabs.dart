import 'package:flutter/material.dart';
import 'package:ninja_core/ninja_core.dart';

class LargeFab extends StatefulWidget {
  const LargeFab({Key? key}) : super(key: key);

  @override
  State<LargeFab> createState() => _LargeFabState();
}

class _LargeFabState extends State<LargeFab> {
  bool isEnable = true;

  _onChangeEnable() => setState(() => isEnable = !isEnable);

  @override
  Widget build(BuildContext context) {
    void Function()? onPressed = isEnable ? () {} : null;
    return NJCard(
      width: 1280 / 2.5,
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
                    iconData: Icons.edit_rounded, onPressed: onPressed, njFabSize: NjFabSize.large),
                const NJPadding(
                    padding: NJEdgeInsets.only(top: NJGapSize.medium), child: NJText.bodyMedium(text: 'Surface'))
              ]),
              Column(children: [
                NJFloatingActionButton.primary(
                    iconData: Icons.edit_rounded, onPressed: onPressed, njFabSize: NjFabSize.large),
                const NJPadding(
                    padding: NJEdgeInsets.only(top: NJGapSize.medium), child: NJText.bodyMedium(text: 'Primary'))
              ]),
              Column(children: [
                NJFloatingActionButton.secondary(
                    iconData: Icons.edit_rounded, onPressed: onPressed, njFabSize: NjFabSize.large),
                const NJPadding(
                    padding: NJEdgeInsets.only(top: NJGapSize.medium), child: NJText.bodyMedium(text: 'Secondary'))
              ]),
              Column(children: [
                NJFloatingActionButton.tertiary(
                    iconData: Icons.edit_rounded, onPressed: onPressed, njFabSize: NjFabSize.large),
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
