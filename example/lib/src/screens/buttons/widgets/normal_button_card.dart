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
              text: 'M3 Button', textAlign: TextAlign.start),
          const M3Space.small(),
          M3Button(onPressed: !_isEnable ? null : () {}, text: 'M3Button'),
          const M3Space.small(),
          M3Button.filled(
              onPressed: !_isEnable ? null : () {}, text: 'M3Button.filled'),
          const M3Space.small(),
          M3Button.filledTonal(
              onPressed: !_isEnable ? null : () {},
              text: 'M3Button.filledTonal'),
          const M3Space.small(),
          const M3Space.small(),
          M3Button.outline(
              onPressed: !_isEnable ? null : () {}, text: "M3Button.outline"),
          const M3Space.small(),
          M3Button.text(
              onPressed: !_isEnable ? null : () {}, text: "M3Button.text"),
          const M3Space.small(),
          const M3Divider(),
          const M3Space.small(),
          M3Button(onPressed: _changeEnable, text: _getStr()),
        ],
      ),
    );
  }
}
