import 'package:flutter/material.dart';
import 'package:ninja_core/ninja_core.dart';

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
                NJText.titleLarge(
                    text: 'Normal Icon Button',
                    textAlign: TextAlign.start,
                    color: Theme.of(context).colorScheme.error),
                const NJGap.medium(),
                NJButtonWithIcon(
                    onPressed: !_isEnable ? null : () {},
                    text: 'NjButtonWithIcon',
                    reverseIcon: _reverse,
                    icon: Icons.add),
                const NJGap.small(),
                NJButtonWithIcon.filled(
                    onPressed: !_isEnable ? null : () {},
                    text: 'NjButtonWithIcon.filled',
                    reverseIcon: _reverse,
                    icon: Icons.add),
                const NJGap.small(),
                NJButtonWithIcon.filledTonal(
                    onPressed: !_isEnable ? null : () {},
                    text: 'NjButtonWithIcon.filledTonal',
                    reverseIcon: _reverse,
                    icon: Icons.add),
                const NJGap.small(),
                NJButtonWithIcon.outline(
                    onPressed: !_isEnable ? null : () {},
                    text: "NjButtonWithIcon.outline",
                    reverseIcon: _reverse,
                    icon: Icons.add),
                const NJGap.small(),
                NJButtonWithIcon.text(
                    onPressed: !_isEnable ? null : () {},
                    text: "NjButtonWithIcon.text",
                    reverseIcon: _reverse,
                    icon: Icons.add),
                const NJGap.small(),
                const NJDivider(),
                const NJGap.small(),
                Wrap(
                  spacing: NJGapSize.medium.size,
                  runSpacing: NJGapSize.medium.size,
                  alignment: WrapAlignment.center,
                  children: [
                    NJButton(onPressed: _changeEnable, text: _getStr()),
                    NJButton(onPressed: _changeReverse, text: 'Reverse Icon'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
