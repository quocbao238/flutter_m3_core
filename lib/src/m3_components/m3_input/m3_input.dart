import 'package:flutter/material.dart';

class M3Input extends StatelessWidget {
  final TextEditingController? controller;
  final bool? enabled;
  final bool? disableBackground;
  final InputBorder _border;
  final String? labelText;
  final bool? filled;
  final String? supportingText;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final IconData? prefixIconData;
  final IconData? suffixIconData;
  final String? errorText;

  // final String label;

  const M3Input(
      {super.key,
      this.controller,
      this.enabled,
      this.labelText,
      this.filled,
      this.supportingText,
      this.prefixWidget,
      this.suffixWidget,
      this.prefixIconData,
      this.suffixIconData,
      this.disableBackground = false,
      this.errorText})
      : _border = const UnderlineInputBorder();

  const M3Input.outline(
      {super.key,
      this.controller,
      this.enabled,
      this.labelText,
      this.filled,
      this.supportingText,
      this.prefixWidget,
      this.suffixWidget,
      this.prefixIconData,
      this.suffixIconData,
      this.disableBackground = false,
      this.errorText})
      : _border = const OutlineInputBorder();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        enabled: enabled ?? true,
        border: _border,
        labelText: labelText,
        filled: !disableBackground!,
        helperText: supportingText,
        errorText: errorText,
        prefixIcon: prefixWidget ??
            (prefixIconData == null
                ? null
                : SizedBox(
                    width: 48,
                    height: 48,
                    child: Center(
                      child: Icon(prefixIconData,
                          size: 24,
                          color:
                              Theme.of(context).colorScheme.onSurfaceVariant),
                    ),
                  )),
        suffixIcon: suffixWidget ??
            (suffixIconData == null
                ? null
                : SizedBox(
                    width: 48,
                    height: 48,
                    child: Center(
                      child: Icon(suffixIconData,
                          size: 24,
                          color: errorText == null
                              ? Theme.of(context).colorScheme.onSurfaceVariant
                              : Theme.of(context).colorScheme.error),
                    ))),
      ),
    );
  }
}
