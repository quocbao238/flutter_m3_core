import 'package:example/src/palette/palette_screen.dart';
import 'package:flutter/material.dart';
import 'package:ninja_core/ninja_core.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: false,
      actions: [
        NjButton(
          onPressed: () => showDialogPaletteColor(context),
          child: const Icon(Icons.palette),
        ),
        NjPadding(
          padding: const NjEdgeInsets.symmetric(horizontal: NjGapSize.small),
          child: NjButton(
            onPressed: () => NinjaThemeProvider.toggleTheme(context),
            child: Icon(Theme.of(context).brightness == Brightness.light ? Icons.brightness_3 : Icons.brightness_7),
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  Future<void> showDialogPaletteColor(BuildContext context) async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Change M3 Base Color'),
        contentPadding:  EdgeInsets.all(NjGapSize.regular.size),
        content: SizedBox(
          width: double.maxFinite,
          height: MediaQuery.of(context).size.width / 1.5,
          child: GridView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6, crossAxisSpacing: NjGapSize.small.size, mainAxisSpacing: NjGapSize.small.size),
            children: listPaletteColor.entries
                .map((e) => NjButton(
                    text: '',
                    foregroundColor: e.value,
                    onPressed: () => NinjaThemeProvider.changeM3Color(context, e.value)))
                .toList(),
          ),
        ),
        actions: <Widget>[
          NjButton.text(
            child: const Text('Close'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}
