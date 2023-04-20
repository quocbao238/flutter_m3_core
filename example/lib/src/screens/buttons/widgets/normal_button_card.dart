import 'package:flutter/material.dart';
import 'package:ninja_core/ninja_core.dart';

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
    return SizedBox(
      width: 1280/3.2,
      child: NJPadding(
        padding: const NJEdgeInsets.symmetric(vertical: NJGapSize.medium),
        child: Card(
          elevation: 4,
          color: Theme.of(context).colorScheme.surface,
          shadowColor: Theme.of(context).colorScheme.onSurface,
          child: NJPadding.regular(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const NJText.titleLarge(
                    text: 'Normal Button', textAlign: TextAlign.start),
                const NJGap.small(),
                NJButton(
                    onPressed: !_isEnable ? null : () {}, text: 'NjButton'),
                const NJGap.small(),
                NJButton.filled(
                    onPressed: !_isEnable ? null : () {},
                    text: 'NjButton.filled'),
                const NJGap.small(),
                NJButton.filledTonal(
                    onPressed: !_isEnable ? null : () {},
                    text: 'NjButton.filledTonal'),
                const NJGap.small(),
                const NJGap.small(),
                NJButton.outline(
                    onPressed: !_isEnable ? null : () {},
                    text: "NjButton.outline"),
                const NJGap.small(),
                NJButton.text(
                    onPressed: !_isEnable ? null : () {},
                    text: "NjButton.text"),
                const NJGap.small(),
                const NJDivider(),
                const NJGap.small(),
                NJButton(onPressed: _changeEnable, text: _getStr()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
