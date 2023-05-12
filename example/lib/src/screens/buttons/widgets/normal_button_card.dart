import 'package:flutter/material.dart';
import 'package:ninja_core/m3_theme_core.dart';

class NormalButtons extends StatefulWidget {
  const NormalButtons({super.key});

  @override
  State<NormalButtons> createState() => _NormalButtonState();
}

class _NormalButtonState extends State<NormalButtons> {
  bool _isEnable = true;

  void _changeEnable() => setState(() => _isEnable = !_isEnable);

  String _getStr() => _isEnable ? 'Disable Button' : 'Enable Button';

  @override
  Widget build(BuildContext context) {
    return M3Card(
      width: 1280 / 3.2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const M3Text.titleLarge(
              text: 'Normal Button', textAlign: TextAlign.start),
          const M3Space.small(),
          M3Button(onPressed: !_isEnable ? null : () {}, text: 'NjButton'),
          const M3Space.small(),
          M3Button.filled(
              onPressed: !_isEnable ? null : () {}, text: 'NjButton.filled'),
          const M3Space.small(),
          M3Button.filledTonal(
              onPressed: !_isEnable ? null : () {},
              text: 'NjButton.filledTonal'),
          const M3Space.small(),
          const M3Space.small(),
          M3Button.outline(
              onPressed: !_isEnable ? null : () {}, text: "NjButton.outline"),
          const M3Space.small(),
          M3Button.text(
              onPressed: !_isEnable ? null : () {}, text: "NjButton.text"),
          const M3Space.small(),
          const M3Divider(),
          const M3Space.small(),
          M3Button(onPressed: _changeEnable, text: _getStr()),
        ],
      ),
    );
  }
}
