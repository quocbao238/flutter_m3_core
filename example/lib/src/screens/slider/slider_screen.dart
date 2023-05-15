import 'package:example/src/screens/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:ninja_core/m3_theme_core.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({super.key});

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double val1 = 0.0;
  double val2 = 0.0;
  double val3 = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Slider'),
      body: M3Padding.medium(
        child: Column(
          children: [
            M3Card(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const M3Text.titleLarge(text: 'M3 Slider'),
                Slider(
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
                const M3Text.titleLarge(text: 'M3 Slider Surface'),
                Slider(
                    value: val2.toDouble(),
                    min: 0.0,
                    max: 330.0,
                    thumbColor: Theme.of(context).colorScheme.surface,
                    activeColor: Theme.of(context).colorScheme.surface,
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
                const M3Text.titleLarge(text: 'M3 Slider onSurface'),
                Slider(
                    value: val2.toDouble(),
                    min: 0.0,
                    max: 330.0,
                    thumbColor: Theme.of(context).colorScheme.onSurface,
                    activeColor: Theme.of(context).colorScheme.onSurface,
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
                const M3Text.titleLarge(text: 'M3 Slider'),
                Slider(
                    value: val3.toDouble(),
                    min: 0.0,
                    max: 100.0,
                    thumbColor: Theme.of(context).colorScheme.tertiary,
                    activeColor: Theme.of(context).colorScheme.tertiary,
                    onChanged: (double newValue) =>
                        setState(() => val3 = newValue)),
                Center(
                  child: M3Text.bodyMedium(
                      text: 'Slider value: ${val3.toStringAsFixed(2)}'),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
