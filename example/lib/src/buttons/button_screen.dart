import 'package:example/src/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:ninja_core/ninja_core.dart';

class ButtonScreen extends StatefulWidget {
  const ButtonScreen({Key? key}) : super(key: key);

  @override
  State<ButtonScreen> createState() => _ButtonScreenState();
}

class _ButtonScreenState extends State<ButtonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Ninja Buttons'),
      body: NjPadding.regular(
        child: ListView(
          children: const [
            NJText.titleLarge(text: 'Buttons',textAlign: TextAlign.start),
            NjPadding(
                padding: NjEdgeInsets.symmetric(vertical: NjGapSize.medium),
                child: ButtonsWithoutIcon()),

            NJText.titleLarge(text: 'Buttons with Icon',textAlign: TextAlign.start),

            NjPadding(
                padding: NjEdgeInsets.symmetric(vertical: NjGapSize.medium),
                child: ButtonsWithIcon()),
          ],
        ),
      ),
    );
  }
}


class ButtonsWithIcon extends StatefulWidget {
  const ButtonsWithIcon({Key? key}) : super(key: key);

  @override
  State<ButtonsWithIcon> createState() => _ButtonsWithIconState();
}

class _ButtonsWithIconState extends State<ButtonsWithIcon> {

  bool _isEnable = true;

  void _changeEnable() => setState(() => _isEnable = !_isEnable);

  String _getStr() => _isEnable ? 'Disable Button' : 'Enable Button';


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: Theme.of(context).colorScheme.surface,
      shadowColor: Theme.of(context).colorScheme.onSurface,
      child: NjPadding.regular(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            NjButtonWithIcon(onPressed: !_isEnable ? null : () {}, text: 'NjButtonWithIcon', icon: Icons.add),
            const NjGap.small(),
            NjButtonWithIcon.filled(onPressed: !_isEnable ? null : () {}, text: 'NjButtonWithIcon.filled', icon: Icons.add),
            const NjGap.small(),
            NjButtonWithIcon.filledTonal(onPressed: !_isEnable ? null : () {}, text: 'NjButtonWithIcon.filledTonal', icon: Icons.add),
            const NjGap.small(),
            NjButtonWithIcon.outline(onPressed: !_isEnable ? null : () {}, text: "NjButtonWithIcon.outline", icon: Icons.add),
            const NjGap.small(),
            NjButtonWithIcon.text(onPressed: !_isEnable ? null : () {}, text: "NjButtonWithIcon.text", icon: Icons.add),
            NjButton(onPressed: _changeEnable, text: _getStr()),
          ],
        ),
      ),
    );
  }
}


class ButtonsWithoutIcon extends StatefulWidget {
  const ButtonsWithoutIcon({super.key});

  @override
  State<ButtonsWithoutIcon> createState() => _ButtonsWithoutIconState();
}

class _ButtonsWithoutIconState extends State<ButtonsWithoutIcon> {
  bool _isEnable = true;

  void _changeEnable() => setState(() => _isEnable = !_isEnable);

  String _getStr() => _isEnable ? 'Disable Button' : 'Enable Button';

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: Theme.of(context).colorScheme.surface,
      shadowColor: Theme.of(context).colorScheme.onSurface,
      child: NjPadding.regular(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            NjButton(onPressed: !_isEnable ? null : () {}, text: 'NjButton'),
            const NjGap.small(),
            NjButton.filled(onPressed: !_isEnable ? null : () {}, text: 'NjButton.filled'),
            const NjGap.small(),
            NjButton.filledTonal(onPressed: !_isEnable ? null : () {}, text: 'NjButton.filledTonal'),
            const NjGap.small(),
            NjButton.outline(onPressed: !_isEnable ? null : () {}, text: "NjButton.outline"),
            const NjGap.small(),
            NjButton.text(onPressed: !_isEnable ? null : () {}, text: "NjButton.text"),
            NjButton(onPressed: _changeEnable, text: _getStr()),
          ],
        ),
      ),
    );
  }
}
