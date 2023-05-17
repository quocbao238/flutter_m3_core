import 'package:flutter/material.dart';
import 'package:flutter_m3_core/m3_theme_core.dart';

class CustomContentHeaderWeb extends StatelessWidget {
  final String title;
  final Widget child;
  const CustomContentHeaderWeb(
      {super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return M3Padding(
      padding: const M3EdgeInsets.symmetric(
          vertical: M3Spacing.medium, horizontal: M3Spacing.medium),
      child: M3Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            M3Text.titleLarge(
              text: title,
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
            const M3Space.large(),
            child
          ],
        ),
      ),
    );
  }
}
