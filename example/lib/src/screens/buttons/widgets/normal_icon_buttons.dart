import 'package:flutter/material.dart';
import 'package:flutter_m3_core/m3_theme_core.dart';

class NormalIconButtons extends StatefulWidget {
  const NormalIconButtons({super.key});

  @override
  State<NormalIconButtons> createState() => _NormalIconButtonState();
}

class _NormalIconButtonState extends State<NormalIconButtons> {
  bool _isEnable = true;
  bool _reverse = false;

  void _changeEnable() => setState(() => _isEnable = !_isEnable);

  String _getStr() => _isEnable ? 'Disable Button' : 'Enable Button';

  void _changeReverse() => setState(() => _reverse = !_reverse);

  @override
  Widget build(BuildContext context) {
    return M3Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          M3Text.titleLarge(
              text: 'M3 Button With Icon',
              textAlign: TextAlign.start,
              color: Theme.of(context).colorScheme.error),
          const M3Space.medium(),
          M3ButtonWithIcon(
              onPressed: !_isEnable ? null : () {},
              text: 'M3ButtonWithIcon',
              reverseIcon: _reverse,
              icon: Icons.add),
          const M3Space.small(),
          M3ButtonWithIcon.filled(
              onPressed: !_isEnable ? null : () {},
              text: 'M3ButtonWithIcon.filled',
              reverseIcon: _reverse,
              icon: Icons.add),
          const M3Space.small(),
          M3ButtonWithIcon.filledTonal(
              onPressed: !_isEnable ? null : () {},
              text: 'M3ButtonWithIcon.filledTonal',
              reverseIcon: _reverse,
              icon: Icons.add),
          const M3Space.small(),
          M3ButtonWithIcon.outline(
              onPressed: !_isEnable ? null : () {},
              text: "M3ButtonWithIcon.outline",
              reverseIcon: _reverse,
              icon: Icons.add),
          const M3Space.small(),
          M3ButtonWithIcon.text(
              onPressed: !_isEnable ? null : () {},
              text: "M3ButtonWithIcon.text",
              reverseIcon: _reverse,
              icon: Icons.add),
          const M3Space.small(),
          const M3Divider(),
          const M3Space.small(),
          Wrap(
            spacing: M3Spacing.medium.size,
            runSpacing: M3Spacing.medium.size,
            alignment: WrapAlignment.center,
            children: [
              M3Button(onPressed: _changeEnable, text: _getStr()),
              M3Button(onPressed: _changeReverse, text: 'Reverse Icon'),
            ],
          ),
        ],
      ),
    );
  }
}
