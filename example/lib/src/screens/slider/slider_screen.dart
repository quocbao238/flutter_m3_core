import 'package:example/src/screens/widgets/custom_app_bar.dart';
import 'package:example/src/screens/widgets/custom_header_content_web.dart';
import 'package:flutter/material.dart';
import 'package:ninja_core/m3_theme_core.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({super.key});

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double val1 = 0.4;
  double val2 = 26.0;
  double val3 = 180.0;
  double val4 = 15.0;

  @override
  Widget build(BuildContext context) {
    if (M3DeviceService.isDesktop() || M3DeviceService.isWeb()) {
      return CustomContentHeaderWeb(title: 'M3 Slider', child: _body());
    }

    return Scaffold(
      appBar: const CustomAppBar(title: 'M3 Slider'),
      body: M3Padding.medium(
        child: _body(),
      ),
    );
  }

  Column _body() {
    return Column(
      children: [
        M3Card(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const M3Text.titleLarge(text: 'M3 Slider'),
            M3Slider(
                value: val1.toDouble(),
                min: 0.0,
                max: 1.0,
                onChanged: (double newValue) =>
                    setState(() => val1 = newValue)),
            Center(
              child: M3Text.bodyMedium(
                  text: 'Slider value: ${val1.toStringAsFixed(2)}'),
            )
          ],
        )),
        const M3Space.medium(),
        M3Card(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const M3Text.titleLarge(text: 'M3 Slider Primary'),
            M3Slider.primary(
                value: val2.toDouble(),
                min: 0.0,
                max: 330.0,
                onChanged: (double newValue) =>
                    setState(() => val2 = newValue)),
            Center(
              child: M3Text.bodyMedium(
                  text: 'Slider value: ${val2.toStringAsFixed(2)}'),
            )
          ],
        )),
        const M3Space.medium(),
        M3Card(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const M3Text.titleLarge(text: 'M3 Slider Secondary'),
            M3Slider.secondary(
                value: val3.toDouble(),
                min: 0.0,
                max: 330.0,
                onChanged: (double newValue) =>
                    setState(() => val3 = newValue)),
            Center(
              child: M3Text.bodyMedium(
                  text: 'Slider value: ${val2.toStringAsFixed(2)}'),
            )
          ],
        )),
        const M3Space.medium(),
        M3Card(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const M3Text.titleLarge(text: 'M3 Slider tertiary'),
            M3Slider.tertiary(
                value: val4.toDouble(),
                min: 0.0,
                max: 45.0,
                onChanged: (double newValue) =>
                    setState(() => val4 = newValue)),
            Center(
              child: M3Text.bodyMedium(
                  text: 'Slider value: ${val4.toStringAsFixed(2)}'),
            )
          ],
        ))
      ],
    );
  }
}
