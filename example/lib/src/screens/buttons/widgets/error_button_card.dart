import 'package:flutter/material.dart';
import 'package:ninja_core/m3_theme_core.dart';

class ErrorButtons extends StatefulWidget {
  const ErrorButtons({super.key});

  @override
  State<ErrorButtons> createState() => _ErrorButtonsState();
}

class _ErrorButtonsState extends State<ErrorButtons> {
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
          NJText.titleLarge(
              text: 'Error Button',
              textAlign: TextAlign.start,
              color: Theme.of(context).colorScheme.error),
          const M3Space.medium(),
          M3ButtonError(onPressed: !_isEnable ? null : () {}, text: 'NjButton'),
          const M3Space.small(),
          M3ButtonError.filled(
              onPressed: !_isEnable ? null : () {}, text: 'NjButton.filled'),
          const M3Space.small(),
          M3ButtonError.filledTonal(
              onPressed: !_isEnable ? null : () {},
              text: 'NjButton.filledTonal'),
          const M3Space.small(),
          M3ButtonError.outline(
              onPressed: !_isEnable ? null : () {}, text: "NjButton.outline"),
          const M3Space.small(),
          M3ButtonError.text(
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
