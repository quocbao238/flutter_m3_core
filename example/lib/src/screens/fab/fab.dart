import 'package:example/src/screens/fab/extend_fabs.dart';
import 'package:example/src/screens/fab/largel_fabs.dart';
import 'package:example/src/screens/fab/normal_fabs.dart';
import 'package:example/src/screens/fab/small_fabs.dart';
import 'package:example/src/screens/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:ninja_core/ninja_core.dart';

class FabScreen extends StatelessWidget {
  const FabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Ninja Floating Action Button'),
      body: NJPadding.medium(
        child: SingleChildScrollView(
          child: Wrap(
            spacing: 10,
            runSpacing: 10,

            children: const [
              SmallFab(),
              NormalFab(),
              LargeFab(),
              ExtendFab(),
            ],
          ),
        ),
      ),
    );
  }
}
