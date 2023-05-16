import 'package:example/src/screens/widgets/custom_app_bar.dart';
import 'package:example/src/screens/widgets/custom_header_content_web.dart';
import 'package:flutter/material.dart';
import 'package:flutter_m3_core/m3_theme_core.dart';

class TextFieldsScreen extends StatefulWidget {
  const TextFieldsScreen({super.key});

  @override
  State<TextFieldsScreen> createState() => _TextFieldsScreenState();
}

class _TextFieldsScreenState extends State<TextFieldsScreen> {
  @override
  Widget build(BuildContext context) {
    if (M3DeviceService.isDesktop() || M3DeviceService.isWeb()) {
      return CustomContentHeaderWeb(
          title: 'M3 Input', child: Expanded(child: _body()));
    }

    return Scaffold(
      appBar: const CustomAppBar(title: 'M3 Input'),
      body: M3Padding.medium(
        child: _body(),
      ),
    );
  }

  Widget _body() {
    return ListView(
      shrinkWrap: true,
      children: const [
        M3Inputs(title: 'M3 Input Label only'),
        M3Inputs(title: 'M3 Input Prefix Icon', prefixIconData: Icons.search),
        M3Inputs(title: 'M3 Input Suffix Icon', suffixIconData: Icons.cancel),
        M3Inputs(
            title: 'M3 Input Prefix Icon & Suffix Icon',
            prefixIconData: Icons.search,
            suffixIconData: Icons.cancel),
        M3Divider(),
        M3Inputs(isOutline: true, title: 'M3 Input Label only'),
        M3Inputs(
            isOutline: true,
            title: 'M3 Input Prefix Icon',
            prefixIconData: Icons.search),
        M3Inputs(
            isOutline: true,
            title: 'M3 Input Suffix Icon',
            suffixIconData: Icons.cancel),
        M3Inputs(
            isOutline: true,
            title: 'M3 Input Prefix Icon & Suffix Icon',
            prefixIconData: Icons.search,
            suffixIconData: Icons.cancel),
      ],
    );
  }
}

class M3Inputs extends StatelessWidget {
  final String title;
  final IconData? suffixIconData;
  final IconData? prefixIconData;
  final bool? isOutline;
  const M3Inputs(
      {super.key,
      this.suffixIconData,
      this.isOutline = false,
      this.prefixIconData,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return M3Padding(
      padding: const M3EdgeInsets.only(bottom: M3Spacing.medium),
      child: M3Card(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          M3Text.titleMedium(
              text: title + (isOutline! ? ' outline' : ''),
              color: Theme.of(context).colorScheme.primary),
          const M3Space.medium(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: M3InputToggle(
                  isOutline: isOutline,
                  labelText: 'Label only',
                  suffixIconData: suffixIconData,
                  prefixIconData: prefixIconData,
                ),
              ),
              const M3Space.small(),
              Expanded(
                child: M3InputToggle(
                  isOutline: isOutline,
                  controller: TextEditingController(text: 'Input'),
                  labelText: 'Label',
                  supportingText: 'Supporting Text',
                  suffixIconData: suffixIconData,
                  prefixIconData: prefixIconData,
                ),
              ),
            ],
          ),
          const M3Space.medium(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: M3InputToggle(
                  isOutline: isOutline,
                  controller: TextEditingController(text: 'Input'),
                  labelText: 'Label',
                  supportingText: 'Supporting Text',
                  errorText: 'Supporting Text',
                  suffixIconData: Icons.info,
                  prefixIconData: prefixIconData,
                ),
              ),
              const M3Space.small(),
              Expanded(
                child: M3InputToggle(
                  isOutline: isOutline,
                  controller: TextEditingController(text: 'Input disabled'),
                  labelText: 'Label',
                  supportingText: 'Supporting Text',
                  enabled: false,
                  suffixIconData: suffixIconData,
                  prefixIconData: prefixIconData,
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}

class M3InputToggle extends StatelessWidget {
  final TextEditingController? controller;
  final bool? enabled;
  final bool? disableBackground;
  final bool? isOutline;
  final String? labelText;
  final bool? filled;
  final String? supportingText;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final IconData? prefixIconData;
  final IconData? suffixIconData;
  final String? errorText;
  const M3InputToggle(
      {super.key,
      this.controller,
      this.enabled,
      this.disableBackground = false,
      this.isOutline = false,
      this.labelText,
      this.filled,
      this.supportingText,
      this.prefixWidget,
      this.suffixWidget,
      this.prefixIconData,
      this.suffixIconData,
      this.errorText});

  @override
  Widget build(BuildContext context) {
    if (isOutline!) {
      return M3Input.outline(
          controller: controller,
          enabled: enabled,
          disableBackground: disableBackground,
          labelText: labelText,
          filled: filled,
          supportingText: supportingText,
          prefixWidget: prefixWidget,
          suffixWidget: suffixWidget,
          prefixIconData: prefixIconData,
          suffixIconData: suffixIconData,
          errorText: errorText);
    }
    return M3Input(
        controller: controller,
        enabled: enabled,
        disableBackground: disableBackground,
        labelText: labelText,
        filled: filled,
        supportingText: supportingText,
        prefixWidget: prefixWidget,
        suffixWidget: suffixWidget,
        prefixIconData: prefixIconData,
        suffixIconData: suffixIconData,
        errorText: errorText);
  }
}
