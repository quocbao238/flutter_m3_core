import 'package:flutter/material.dart';
import 'package:ninja_core/ninja_core.dart';

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
    return NJCard(
      width: 1280 / 3.2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          NJText.titleLarge(
              text: 'Error Button',
              textAlign: TextAlign.start,
              color: Theme.of(context).colorScheme.error),
          const NJGap.medium(),
          NJButtonError(onPressed: !_isEnable ? null : () {}, text: 'NjButton'),
          const NJGap.small(),
          NJButtonError.filled(
              onPressed: !_isEnable ? null : () {}, text: 'NjButton.filled'),
          const NJGap.small(),
          NJButtonError.filledTonal(
              onPressed: !_isEnable ? null : () {},
              text: 'NjButton.filledTonal'),
          const NJGap.small(),
          NJButtonError.outline(
              onPressed: !_isEnable ? null : () {}, text: "NjButton.outline"),
          const NJGap.small(),
          NJButtonError.text(
              onPressed: !_isEnable ? null : () {}, text: "NjButton.text"),
          const NJGap.small(),
          const NJDivider(),
          const NJGap.small(),
          NJButton(onPressed: _changeEnable, text: _getStr()),
        ],
      ),
    );
  }
}
