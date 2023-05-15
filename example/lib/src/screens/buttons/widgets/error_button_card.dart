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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          M3Text.titleLarge(
              text: 'M3 Error Button',
              textAlign: TextAlign.start,
              color: Theme.of(context).colorScheme.error),
          const M3Space.medium(),
          M3ErrorButton(
              onPressed: !_isEnable ? null : () {}, text: 'M3ErrorButton'),
          const M3Space.small(),
          M3ErrorButton.filled(
              onPressed: !_isEnable ? null : () {},
              text: 'M3ErrorButton.filled'),
          const M3Space.small(),
          M3ErrorButton.filledTonal(
              onPressed: !_isEnable ? null : () {},
              text: 'M3ErrorButton.filledTonal'),
          const M3Space.small(),
          M3ErrorButton.outline(
              onPressed: !_isEnable ? null : () {},
              text: "M3ErrorButton.outline"),
          const M3Space.small(),
          M3ErrorButton.text(
              onPressed: !_isEnable ? null : () {}, text: "M3ErrorButton.text"),
          const M3Space.small(),
          const M3Divider(),
          const M3Space.small(),
          M3Button(onPressed: _changeEnable, text: _getStr()),
        ],
      ),
    );
  }
}
