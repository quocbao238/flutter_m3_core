import 'package:example/src/screens/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:ninja_core/ninja_core.dart';

class FabScreen extends StatelessWidget {
  const FabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Ninja Floating Action Button'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            NJCard(
                child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: const [
                NJFloatingActionButton.surface(iconData: Icons.edit_rounded),
                NJFloatingActionButton.primary(iconData: Icons.edit_rounded),
                NJFloatingActionButton.secondary(iconData: Icons.edit_rounded),
                NJFloatingActionButton.tertiary(iconData: Icons.edit_rounded),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
