import 'dart:math';

import 'package:example/src/screens/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:ninja_core/m3_theme_core.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'M3 Progress'),
      body: Column(
        children: [
          // CircularProgressIndicator(),
          M3Card(
            m3EdgeInsets: const M3EdgeInsets.all(M3Spacing.small),
            child: ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              itemCount: 54,
              itemBuilder: (context, index) {
                final delay = Duration(milliseconds: Random().nextInt(3000));
                return FutureBuilder(
                  future: Future.delayed(delay),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Column(
                        children: [
                          const M3LinearProgressIndicator(),
                          if (index != 54) const M3Space.small(),
                        ],
                      );
                    }
                    return const SizedBox();
                  },
                );
              },
            ),
          ),
          const M3Space.small(),
          const M3Card(
            height: 128,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                M3CircularProgressIndicator(),
                M3Space.small(),
                M3CircularProgressIndicator.adaptive(),
                M3Space.small(),
                M3CircularProgressIndicator(),
                M3Space.small(),
                M3CircularProgressIndicator.adaptive(),
                M3Space.small(),
                M3CircularProgressIndicator(),
                M3Space.small(),
                M3CircularProgressIndicator.adaptive(),
                M3Space.small(),
                M3CircularProgressIndicator(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
