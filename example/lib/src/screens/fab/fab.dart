import 'package:example/src/screens/fab/extend_fabs.dart';
import 'package:example/src/screens/fab/largel_fabs.dart';
import 'package:example/src/screens/fab/normal_fabs.dart';
import 'package:example/src/screens/fab/small_fabs.dart';
import 'package:example/src/screens/widgets/custom_app_bar.dart';
import 'package:example/src/screens/widgets/custom_header_content_web.dart';
import 'package:flutter/material.dart';
import 'package:flutter_m3_core/m3_theme_core.dart';

class FabScreen extends StatelessWidget {
  const FabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if ( M3ViewService.isDesktop()) {
      return CustomContentHeaderWeb(
          title: 'M3 FloatingActionButton', child: Expanded(child: _body(context)));
    }
    return Scaffold(
      appBar: const CustomAppBar(title: 'M3 FloatingActionButton'),
      body: M3Padding.medium(
        child: _body(context),
      ),
    );
  }

  Widget _body(context) =>  SingleChildScrollView(
        child: SizedBox(
         width: MediaQuery.of(context).size.width,
          child: const Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [SmallFab(), NormalFab(), LargeFab(), ExtendFab()],
          ),
        ),
      );
}
