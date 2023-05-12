import 'package:example/src/screens/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:ninja_core/m3_theme_core.dart';

class TypographyScreen extends StatelessWidget {
  const TypographyScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'M3 Typography'),
      body: ListView(
        children: const [
          M3Text.displayLarge(
              text: 'Display Large', textAlign: TextAlign.start),
          M3Space.small(),
          M3Text.displayMedium(
              text: 'Display Medium', textAlign: TextAlign.start),
          M3Space.small(),
          M3Text.displaySmall(
              text: 'Display Small', textAlign: TextAlign.start),
          M3Space.small(),
          M3Text.headlineLarge(
              text: 'Headline Large', textAlign: TextAlign.start),
          M3Space.small(),
          M3Text.headlineMedium(
              text: 'Headline Medium', textAlign: TextAlign.start),
          M3Space.small(),
          M3Text.headlineSmall(
              text: 'Headline Small', textAlign: TextAlign.start),
          M3Space.small(),
          M3Text.titleLarge(text: 'Title Large', textAlign: TextAlign.start),
          M3Space.small(),
          M3Text.titleMedium(text: 'Title Medium', textAlign: TextAlign.start),
          M3Space.small(),
          M3Text.titleSmall(text: 'Title Small', textAlign: TextAlign.start),
          M3Space.small(),
          M3Text.bodyLarge(text: 'Body Large', textAlign: TextAlign.start),
          M3Space.small(),
          M3Text.bodyMedium(text: 'Body Medium', textAlign: TextAlign.start),
          M3Space.small(),
          M3Text.bodySmall(text: 'Body Small', textAlign: TextAlign.start),
          M3Space.small(),
          M3Text.labelLarge(text: 'Label Large', textAlign: TextAlign.start),
          M3Space.small(),
          M3Text.labelMedium(text: 'Label Medium', textAlign: TextAlign.start),
          M3Space.small(),
          M3Text.labelSmall(text: 'Label Small', textAlign: TextAlign.start),
          M3Space.small(),
        ],
      ),
    );
  }
}
