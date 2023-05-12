import 'package:example/src/screens/buttons/widgets/error_button_card.dart';
import 'package:example/src/screens/buttons/widgets/normal_button_card.dart';
import 'package:example/src/screens/buttons/widgets/normal_icon_buttons.dart';
import 'package:example/src/screens/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:ninja_core/m3_theme_core.dart';

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
      body: M3Padding.regular(
        child: SingleChildScrollView(
          child: Wrap(
            spacing: M3Spacing.medium.size,
            runSpacing: M3Spacing.medium.size,
            children: const [
              NormalButtons(),
              ErrorButtons(),
              NormalIconButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
