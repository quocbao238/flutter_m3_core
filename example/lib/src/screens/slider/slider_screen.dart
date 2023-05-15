import 'package:example/src/screens/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:ninja_core/m3_theme_core.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({super.key});

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double _dollars = 0.0;
  double _dollar2 = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Slider'),
      body: M3Padding.medium(
        child: Column(
          children: [
            M3Card(
                child: Column(
              children: [
                Slider(
                    value: _dollars.toDouble(),
                    min: 0.0,
                    max: 330.0,
                    label: '$_dollars dollars',
                    onChanged: (double newValue) =>
                        setState(() => _dollars = newValue),
                    semanticFormatterCallback: (double newValue) =>
                        '${newValue.round()} dollars')
              ],
            )),
            const M3Space.medium(),
            M3Card(
                child: Column(
              children: [
                Slider(
                    value: _dollar2.toDouble(),
                    min: 0.0,
                    max: 330.0,
                    label: '$_dollar2 dollars',
                    onChanged: (double newValue) =>
                        setState(() => _dollar2 = newValue),
                    semanticFormatterCallback: (double newValue) =>
                        '${newValue.round()} dollars')
              ],
            ))
          ],
        ),
      ),
    );
  }
}
