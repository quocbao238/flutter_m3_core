import 'package:example/src/screens/widgets/custom_app_bar.dart';
import 'package:example/src/screens/widgets/custom_header_content_web.dart';
import 'package:flutter/material.dart';
import 'package:flutter_m3_core/m3_theme_core.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (M3DeviceService.isDesktop() || M3DeviceService.isWeb()) {
      return CustomContentHeaderWeb(
          title: 'M3 Progress Indicator',
          child: Expanded(child: _body(context)));
    }

    return Scaffold(
      appBar: const CustomAppBar(title: 'M3 Progress Indicator'),
      body: _body(context),
    );
  }

  SingleChildScrollView _body(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const M3Card(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              M3Text.titleMedium(
                text: 'M3 Linear Progress Indicator',
                fontWeight: FontWeight.bold,
              ),
              M3Space.medium(),
              M3LinearProgressIndicator(),
            ],
          )),
          const M3Padding(
              padding: M3EdgeInsets.symmetric(vertical: M3Spacing.medium),
              child: M3Card(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  M3Text.titleMedium(
                    text: 'M3 Linear Progress Indicator Primary',
                    fontWeight: FontWeight.bold,
                  ),
                  M3Space.medium(),
                  M3LinearProgressIndicator.primary(),
                ],
              ))),
          const M3Card(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              M3Text.titleMedium(
                text: 'M3 Linear Progress Indicator Tertiary',
                fontWeight: FontWeight.bold,
              ),
              M3Space.medium(),
              M3LinearProgressIndicator.tertiary(),
            ],
          )),
          const M3Padding(
              padding: M3EdgeInsets.symmetric(vertical: M3Spacing.medium),
              child: M3Card(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  M3Text.titleMedium(
                    text: 'M3 Linear Progress Indicator Secondary',
                    fontWeight: FontWeight.bold,
                  ),
                  M3Space.medium(),
                  M3LinearProgressIndicator.secondary(),
                ],
              ))),
          const M3Space.medium(),
          M3Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const M3Text.titleMedium(
                  text: 'M3 Circular Progress Indicator',
                  fontWeight: FontWeight.bold,
                ),
                const M3Space.medium(),
                Wrap(
                  spacing: M3Spacing.medium.size,
                  runSpacing: M3Spacing.medium.size,
                  children: [
                    const M3Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          M3CircularProgressIndicator(),
                          M3Space.medium(),
                          M3Text.titleMedium(
                            text: 'Surface',
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ),
                    M3Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const M3CircularProgressIndicator.primary(),
                          const M3Space.medium(),
                          M3Text.titleMedium(
                            text: 'Primary',
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ],
                      ),
                    ),
                    M3Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const M3CircularProgressIndicator.secondary(),
                          const M3Space.medium(),
                          M3Text.titleMedium(
                            text: 'Secondary',
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ],
                      ),
                    ),
                    M3Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const M3CircularProgressIndicator.tertiary(),
                          const M3Space.medium(),
                          M3Text.titleMedium(
                            text: 'Tertiary',
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const M3Space.medium(),
          M3Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const M3Text.titleMedium(
                  text: 'M3 Linear Progress Indicator Adaptive',
                  fontWeight: FontWeight.bold,
                ),
                const M3Space.medium(),
                Wrap(
                  spacing: M3Spacing.medium.size,
                  runSpacing: M3Spacing.medium.size,
                  children: [
                    const M3Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          M3CircularProgressIndicatorAdaptive(),
                          M3Space.medium(),
                          M3Text.titleMedium(
                            text: 'Surface Adaptive',
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ),
                    M3Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const M3CircularProgressIndicatorAdaptive.primary(),
                          const M3Space.medium(),
                          M3Text.titleMedium(
                            text: 'Primary Adaptive',
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ],
                      ),
                    ),
                    M3Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const M3CircularProgressIndicatorAdaptive.secondary(),
                          const M3Space.medium(),
                          M3Text.titleMedium(
                            text: 'Secondary Adaptive',
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ],
                      ),
                    ),
                    M3Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const M3CircularProgressIndicatorAdaptive.tertiary(),
                          const M3Space.medium(),
                          M3Text.titleMedium(
                            text: 'Tertiary Adaptive',
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
