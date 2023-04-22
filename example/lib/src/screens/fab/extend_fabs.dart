import 'package:flutter/material.dart';
import 'package:ninja_core/ninja_core.dart';

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
    return NJCard(
      width: 1280 / 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const NJText.titleMedium(text: 'Extended FABs'),
          const NJGap.medium(),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              Column(children: [
                NJFloatingActionButton.surface(
                    label: 'Label', iconData: Icons.edit_rounded, onPressed: onPressed, njFabSize: NjFabSize.extended),
                const NJPadding(
                    padding: NJEdgeInsets.only(top: NJGapSize.medium), child: NJText.bodyMedium(text: 'Surface'))
              ]),
              Column(children: [
                NJFloatingActionButton.primary(
                    label: 'Label', iconData: Icons.edit_rounded, onPressed: onPressed, njFabSize: NjFabSize.extended),
                const NJPadding(
                    padding: NJEdgeInsets.only(top: NJGapSize.medium), child: NJText.bodyMedium(text: 'Primary'))
              ]),
              Column(children: [
                NJFloatingActionButton.secondary(
                    label: 'Label', iconData: Icons.edit_rounded, onPressed: onPressed, njFabSize: NjFabSize.extended),
                const NJPadding(
                    padding: NJEdgeInsets.only(top: NJGapSize.medium), child: NJText.bodyMedium(text: 'Secondary'))
              ]),
              Column(children: [
                NJFloatingActionButton.tertiary(
                    label: 'Label', iconData: Icons.edit_rounded, onPressed: onPressed, njFabSize: NjFabSize.extended),
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
