import 'package:example/src/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:ninja_core/ninja_core.dart';

Map<String, Color> listPaletteColor = {
  "Colors.red": Colors.red,
  "Colors.pink": Colors.pink,
  "Colors.purple": Colors.purple,
  "Colors.deepPurple": Colors.deepPurple,
  "Colors.indigo": Colors.indigo,
  "Colors.blue": Colors.blue,
  "Colors.lightBlue": Colors.lightBlue,
  "Colors.cyan": Colors.cyan,
  "Colors.teal": Colors.teal,
  "Colors.green": Colors.green,
  "Colors.lightGreen": Colors.lightGreen,
  "Colors.lime": Colors.lime,
  "Colors.yellow": Colors.yellow,
  "Colors.amber": Colors.amber,
  "Colors.orange": Colors.orange,
  "Colors.deepOrange": Colors.deepOrange,
  "Colors.brown": Colors.brown,
  "Colors.grey": Colors.grey,
  "Colors.blueGrey": Colors.blueGrey,
  "Colors.redAccent": Colors.redAccent,
  "Colors.pinkAccent": Colors.pinkAccent,
  "Colors.purpleAccent": Colors.purpleAccent,
  "Colors.deepPurpleAccent": Colors.deepPurpleAccent,
  "Colors.indigoAccent": Colors.indigoAccent,
  "Colors.blueAccent": Colors.blueAccent,
  "Colors.lightBlueAccent": Colors.lightBlueAccent,
  "Colors.cyanAccent": Colors.cyanAccent,
  "Colors.tealAccent": Colors.tealAccent,
  "Colors.greenAccent": Colors.greenAccent,
  "Colors.lightGreenAccent": Colors.lightGreenAccent,
  "Colors.limeAccent": Colors.limeAccent,
  "Colors.yellowAccent": Colors.yellowAccent,
  "Colors.amberAccent": Colors.amberAccent,
};

class PaletteScreen extends StatelessWidget {
  const PaletteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Ninja Palette Colors'),
      body: NjPadding.regular(
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          children: listPaletteColor.entries
              .map((e) => Column(
                    children: [
                      NjButton(
                          text: '',
                          foregroundColor: e.value,
                          onPressed: () => NinjaThemeProvider.changeM3Color(context, e.value)),
                      NJText.titleSmall(text: e.key)
                    ],
                  ))
              .toList(),
        ),
      ),
    );
  }
}
