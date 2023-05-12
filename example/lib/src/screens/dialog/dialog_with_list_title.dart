import 'package:example/src/screens/dialog/nj_dialog_palettle.dart';
import 'package:flutter/material.dart';
import 'package:ninja_core/m3_theme_core.dart';

class DialogWithListTitle extends StatefulWidget {
  const DialogWithListTitle({Key? key}) : super(key: key);

  @override
  State<DialogWithListTitle> createState() => _DialogWithListTitleState();
}

class _DialogWithListTitleState extends State<DialogWithListTitle> {
  final List<String> selectedItems = [];

  _onChange(bool value, String item) => setState(
      () => value ? selectedItems.add(item) : selectedItems.remove(item));

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(DialogPalette.content),
        const M3Divider(
            m3EdgeInsets: M3EdgeInsets.symmetric(vertical: M3Spacing.small)),
        ListTile(
          contentPadding: const EdgeInsets.all(0),
          leading: const CircleAvatar(child: Center(child: Text('1'))),
          title: const Text('List Title 1'),
          subtitle: const Text('List Subtitle 1'),
          trailing: M3CheckBox(
              value: selectedItems.contains('1'),
              onChanged: (v) => _onChange(v!, '1')),
        ),
        ListTile(
          contentPadding: const EdgeInsets.all(0),
          leading: const CircleAvatar(child: Center(child: Text('2'))),
          title: const Text('List Title 2'),
          subtitle: const Text('List Subtitle 2'),
          trailing: M3CheckBox(
              value: selectedItems.contains('2'),
              onChanged: (v) => _onChange(v!, '2')),
        ),
        ListTile(
          contentPadding: const EdgeInsets.all(0),
          leading: const CircleAvatar(child: Center(child: Text('3'))),
          title: const Text('List Title 3'),
          subtitle: const Text('List Subtitle 3'),
          trailing: M3CheckBox(
              value: selectedItems.contains('3'),
              onChanged: (v) => _onChange(v!, '3')),
        ),
      ],
    );
  }
}
