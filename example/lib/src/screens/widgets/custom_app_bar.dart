import 'package:example/src/common/common.dart';
import 'package:flutter/material.dart';
import 'package:ninja_core/m3_theme_core.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shortSize = MediaQuery.of(context).size.shortestSide;
    return AppBar(
      title: M3Text.titleLarge(
        text: title,
        color: Theme.of(context).colorScheme.primary,
        fontWeight: FontWeight.bold,
      ),
      centerTitle: false,
      actions: [
        if (shortSize < 900)
          M3Button(
            onPressed: () => showDialogPaletteColor(context),
            child: const Icon(Icons.palette),
          ),
        if (shortSize < 900)
          M3Padding(
            padding: const M3EdgeInsets.symmetric(horizontal: M3Spacing.small),
            child: M3Button(
              onPressed: () => M3ThemeProvider.toggleTheme(context),
              child: Icon(Theme.of(context).brightness == Brightness.light
                  ? Icons.dark_mode
                  : Icons.light_mode),
            ),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  Future<void> showDialogPaletteColor(BuildContext buildContext) async {
    await showDialog(
      context: buildContext,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        content: SizedBox(
          width: MediaQuery.of(buildContext).size.width * 0.8,
          height: MediaQuery.of(buildContext).size.height * 0.65,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Flexible(
                    child: M3Text.titleMedium(
                      text: 'Change M3 Base Color',
                      maxLines: 2,
                      textAlign: TextAlign.start,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  M3Padding(
                    padding: const M3EdgeInsets.only(left: M3Spacing.small),
                    child: M3ButtonWithIcon.outline(
                        icon: Icons.close,
                        onPressed: () => Navigator.of(ctx).pop(),
                        text: 'Close'),
                  ),
                ],
              ),
              Expanded(
                child: M3Padding(
                  padding:
                      const M3EdgeInsets.symmetric(vertical: M3Spacing.medium),
                  child: OrientationBuilder(builder: (context, orientation) {
                    final int crossAxisCount =
                        orientation == Orientation.portrait ? 4 : 10;

                    return GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossAxisCount,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10),
                      children: listPaletteColor.entries
                          .map(
                            (e) => M3Button(
                                text: '',
                                backgroundColor: e.value,
                                onPressed: () => M3ThemeProvider.changeM3Color(
                                    buildContext, e.value)),
                          )
                          .toList(),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
