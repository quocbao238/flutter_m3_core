import 'package:example/src/common/common.dart';
import 'package:flutter/material.dart';
import 'package:ninja_core/m3_theme_core.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: false,
      actions: [
        M3Button(
          onPressed: () => showDialogPaletteColor(context),
          child: const Icon(Icons.palette),
        ),
        M3Padding(
          padding: const M3EdgeInsets.symmetric(horizontal: M3Spacing.small),
          child: M3Button(
            onPressed: () => M3ThemeProvider.toggleTheme(context),
            child: Icon(Theme.of(context).brightness == Brightness.light
                ? Icons.brightness_3
                : Icons.brightness_7),
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
                children: [
                  const Flexible(
                    child: M3Text.titleMedium(
                      text: 'Change M3 Base Color',
                      maxLines: 1,
                      textAlign: TextAlign.center,
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
                  child: GridView(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 8,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10),
                      children: [
                        ...listPaletteColor.entries
                            .map(
                              (e) => M3Button(
                                text: '',
                                backgroundColor: e.value,
                                onPressed: () => M3ThemeProvider.changeM3Color(
                                    buildContext, e.value),
                              ),
                            )
                            .toList(),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
