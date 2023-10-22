import 'package:flutter/material.dart';

import 'm3_input_enum.dart';

class M3Input extends StatelessWidget {
  final M3InputEnum _type;
  final TextEditingController? controller;
  final bool? enabled;
  final bool? disableBackground;
  final InputBorder? inputBorder;
  final String? labelText;
  final bool? filled;
  final Color? fillColor;
  final String? supportingText;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final IconData? prefixIconData;
  final IconData? suffixIconData;
  final String? errorText;
  final bool? obscureText;
  final bool? readOnly;
  final BorderRadius? borderRadius;

  // final String label;

  const M3Input(
      {super.key,
      this.controller,
      this.enabled,
      this.labelText,
      this.filled,
      this.fillColor,
      this.supportingText,
      this.prefixWidget,
      this.suffixWidget,
      this.prefixIconData,
      this.suffixIconData,
      this.obscureText,
      this.inputBorder,
      this.readOnly,
      this.borderRadius,
      this.disableBackground = false,
      this.errorText})
      : _type = M3InputEnum.outline;

  const M3Input.outline(
      {super.key,
      this.controller,
      this.enabled,
      this.labelText,
      this.filled,
      this.fillColor,
      this.supportingText,
      this.prefixWidget,
      this.suffixWidget,
      this.obscureText,
      this.readOnly,
      this.prefixIconData,
      this.suffixIconData,
      this.inputBorder,
      this.borderRadius,
      this.disableBackground = false,
      this.errorText})
      : _type = M3InputEnum.outline;

  const M3Input.underline(
      {super.key,
      this.controller,
      this.enabled,
      this.labelText,
      this.filled,
      this.fillColor,
      this.supportingText,
      this.prefixWidget,
      this.suffixWidget,
      this.obscureText,
      this.readOnly,
      this.prefixIconData,
      this.suffixIconData,
      this.inputBorder,
      this.borderRadius,
      this.disableBackground = false,
      this.errorText})
      : _type = M3InputEnum.underline;

  const M3Input.filled(
      {super.key,
      this.controller,
      this.enabled,
      this.labelText,
      this.filled,
      this.fillColor,
      this.supportingText,
      this.prefixWidget,
      this.suffixWidget,
      this.obscureText,
      this.readOnly,
      this.prefixIconData,
      this.suffixIconData,
      this.inputBorder,
      this.borderRadius,
      this.disableBackground = false,
      this.errorText})
      : _type = M3InputEnum.filled;

  @override
  Widget build(BuildContext context) {
    final inputBorder = _type.getInputBorder(borderRadius);

    return TextField(
      controller: controller,
      obscureText: obscureText ?? false,
      readOnly: readOnly ?? false,
      decoration: InputDecoration(
        enabled: enabled ?? true,
        border: inputBorder,
        labelText: labelText,
        filled: filled ?? !disableBackground!,
        fillColor: fillColor,
        helperText: supportingText,
        errorText: errorText,
        prefixIcon: prefixWidget ??
            (prefixIconData == null
                ? null
                : SizedBox(
                    width: 48,
                    height: 48,
                    child: Center(
                      child: Icon(prefixIconData, size: 24, color: Theme.of(context).colorScheme.onSurfaceVariant),
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
