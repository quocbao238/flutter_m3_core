import 'package:flutter/material.dart';

class NJCheckBox extends StatelessWidget {
  final bool? value;
  final bool? isError;
  final bool? tristate;
  final Function(bool?)? onChanged;

  const NJCheckBox(
      {Key? key,
      required this.value,
      this.onChanged,
      this.isError,
      this.tristate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Checkbox(
        value: value,
        isError: isError ?? false,
        tristate: tristate ?? false,
        onChanged: onChanged,
        activeColor: scheme.primary,
        checkColor: scheme.onPrimary);

    return Checkbox(value: value, onChanged: onChanged);
  }
}
