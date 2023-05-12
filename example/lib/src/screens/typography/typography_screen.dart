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
          NJText.displayLarge(
              text: 'Display Large', textAlign: TextAlign.start),
          M3Space.small(),
          NJText.displayMedium(
              text: 'Display Medium', textAlign: TextAlign.start),
          M3Space.small(),
          NJText.displaySmall(
              text: 'Display Small', textAlign: TextAlign.start),
          M3Space.small(),
          NJText.headlineLarge(
              text: 'Headline Large', textAlign: TextAlign.start),
          M3Space.small(),
          NJText.headlineMedium(
              text: 'Headline Medium', textAlign: TextAlign.start),
          M3Space.small(),
          NJText.headlineSmall(
              text: 'Headline Small', textAlign: TextAlign.start),
          M3Space.small(),
          NJText.titleLarge(text: 'Title Large', textAlign: TextAlign.start),
          M3Space.small(),
          NJText.titleMedium(text: 'Title Medium', textAlign: TextAlign.start),
          M3Space.small(),
          NJText.titleSmall(text: 'Title Small', textAlign: TextAlign.start),
          M3Space.small(),
          NJText.bodyLarge(text: 'Body Large', textAlign: TextAlign.start),
          M3Space.small(),
          NJText.bodyMedium(text: 'Body Medium', textAlign: TextAlign.start),
          M3Space.small(),
          NJText.bodySmall(text: 'Body Small', textAlign: TextAlign.start),
          M3Space.small(),
          NJText.labelLarge(text: 'Label Large', textAlign: TextAlign.start),
          M3Space.small(),
          NJText.labelMedium(text: 'Label Medium', textAlign: TextAlign.start),
          M3Space.small(),
          NJText.labelSmall(text: 'Label Small', textAlign: TextAlign.start),
          M3Space.small(),
        ],
      ),
    );
  }
}
