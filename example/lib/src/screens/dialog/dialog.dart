import 'package:example/src/screens/dialog/dialog_with_list_title.dart';
import 'package:example/src/screens/dialog/nj_dialog_palettle.dart';
import 'package:example/src/screens/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:ninja_core/ninja_core.dart';

class DialogScreen extends StatelessWidget {
  const DialogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Ninja Dialogs'),
      body: SingleChildScrollView(
        child: NJPadding.medium(
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            NJButton.filledTonal(text: 'Basic Dialog', onPressed: () => _showBasicDialog(context)),
            const NJGap.medium(),
            NJButton.filledTonal(text: 'Dialog With Icon', onPressed: () => _showIconDialog(context)),
            const NJGap.medium(),
            NJButton.filledTonal(text: 'Dialog List Title', onPressed: () => _showDialogListTitle(context)),
            const NJGap.medium(),
            NJButton.filledTonal(text: 'Dialog List Title With Icon', onPressed: () => _showDialogListTitleIcon(context))
          ]),
        ),
      ),
    );
  }

  Future<void> _showBasicDialog(BuildContext context) async {
    final actions = [
      NJButton.text(text: 'Cancel', onPressed: () => Navigator.of(context).pop(false)),
      NJButton.text(text: 'Ok', onPressed: () => Navigator.of(context).pop(true))
    ];
    final result = await NJDialog.showBasicDialog(
        context: context, title: DialogPalette.title, content: DialogPalette.content, actions: actions);
  }

  Future<void> _showIconDialog(BuildContext context) async {
    final actions = [
      NJButton.text(text: 'Cancel', onPressed: () => Navigator.of(context).pop(false)),
      NJButton.text(text: 'Ok', onPressed: () => Navigator.of(context).pop(true)),
    ];
    final result = await NJDialog.showIconsDialog(
        context: context,
        title: DialogPalette.title,
        content: DialogPalette.content,
        actions: actions,
        icon: Icons.info_outline_rounded);
  }

  Future<void> _showDialogListTitle(BuildContext context) async {
    final actions = [
      NJButton.text(text: 'Cancel', onPressed: () => Navigator.of(context).pop(false)),
      NJButton.text(text: 'Ok', onPressed: () => Navigator.of(context).pop(true)),
    ];

    final result = await NJDialog.showBasicDialog(
        context: context, title: DialogPalette.title, child: const DialogWithListTitle(), actions: actions);
  }

  Future<void> _showDialogListTitleIcon(BuildContext context) async {
    final actions = [
      NJButton.text(text: 'Cancel', onPressed: () => Navigator.of(context).pop(false)),
      NJButton.text(text: 'Ok', onPressed: () => Navigator.of(context).pop(true)),
    ];

    final result = await NJDialog.showIconsDialog(
        context: context,
        title: DialogPalette.title,
        child: const DialogWithListTitle(),
        actions: actions,
        icon: Icons.info_outline_rounded);
  }
}
