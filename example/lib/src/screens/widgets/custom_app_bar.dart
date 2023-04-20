import 'package:example/src/common/common.dart';
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
        NJButton(
          onPressed: () => showDialogPaletteColor(context),
          child: const Icon(Icons.palette),
        ),
        NJPadding(
          padding: const NJEdgeInsets.symmetric(horizontal: NJGapSize.small),
          child: NJButton(
            onPressed: () => NJThemeProvider.toggleTheme(context),
            child: Icon(Theme.of(context).brightness == Brightness.light
                ? Icons.brightness_3
                : Icons.brightness_7),
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
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
                    child: NJText.titleMedium(
                      text: 'Change M3 Base Color',
                      maxLines: 1,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  NJPadding(
                    padding: const NJEdgeInsets.only(left: NJGapSize.small),
                    child: NJButtonWithIcon.outline(
                        icon: Icons.close,
                        onPressed: () => Navigator.of(ctx).pop(),
                        text: 'Close'),
                  ),
                ],
              ),
              Expanded(
                child: NJPadding(
                  padding:
                      const NJEdgeInsets.symmetric(vertical: NJGapSize.medium),
                  child: GridView(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 6,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10),
                      children: [
                        ...listPaletteColor.entries
                            .map(
                              (e) => NJButton(
                                text: '',
                                backgroundColor: e.value,
                                onPressed: () => NJThemeProvider.changeM3Color(
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
