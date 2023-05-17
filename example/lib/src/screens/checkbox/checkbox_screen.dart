import 'dart:core';

import 'package:example/src/screens/widgets/custom_app_bar.dart';
import 'package:example/src/screens/widgets/custom_header_content_web.dart';
import 'package:flutter/material.dart';
import 'package:flutter_m3_core/m3_theme_core.dart';

class CheckBoxScreen extends StatelessWidget {
  const CheckBoxScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if ( M3ViewService.isDesktop()) {
      return CustomContentHeaderWeb(
          title: 'M3 Badge', child: Expanded(child: _body()));
    }

    return Scaffold(
      appBar: const CustomAppBar(title: 'M3 CheckBox'),
      body: M3Padding.medium(
        child: _body(),
      ),
    );
  }

  SingleChildScrollView _body() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const CheckBoxTest(),
          M3Card(
              child: Wrap(
            spacing: M3Spacing.regular.size,
            runSpacing: M3Spacing.regular.size,
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            children: [
              _checkBoxView(value: true, onChanged: (val) {}),
              _checkBoxView(value: true),
              _checkBoxView(value: false, onChanged: (val) {}),
              _checkBoxView(value: false),
              const M3Divider(),
              _checkBoxView(value: true, onChanged: (val) {}, isError: true),
              _checkBoxView(value: true),
              _checkBoxView(value: false, onChanged: (val) {}, isError: true),
              _checkBoxView(value: false),
              const M3Divider(),
              _checkBoxView(value: null, onChanged: (val) {}, tristate: true),
              _checkBoxView(value: null, tristate: true),
              _checkBoxView(value: null, onChanged: (val) {}, tristate: true),
              _checkBoxView(value: null, tristate: true),
              const M3Divider(),
              _checkBoxView(
                  value: null,
                  onChanged: (val) {},
                  tristate: true,
                  isError: true),
              _checkBoxView(value: null, tristate: true, isError: true),
              _checkBoxView(
                  value: null,
                  onChanged: (val) {},
                  tristate: true,
                  isError: true),
              _checkBoxView(value: null, tristate: true, isError: true),

              // )
            ],
          ))
        ],
      ),
    );
  }
}

Widget _checkBoxView(
    {bool? value, Function(bool?)? onChanged, bool? isError, bool? tristate}) {
  String getStrByFunction() =>
      'M3CheckBox {value = $value, status = ${onChanged != null ? 'enable' : 'disable'}, isError = $isError, tristate = $tristate}';

  return Row(
    children: [
      M3CheckBox(
          value: value,
          onChanged: onChanged,
          isError: isError,
          tristate: tristate),
      Expanded(
          child: M3Text.bodyMedium(
              textAlign: TextAlign.start,
              maxLines: 1,
              text: getStrByFunction())),
    ],
  );
}

class CheckBoxTest extends StatefulWidget {
  const CheckBoxTest({Key? key}) : super(key: key);

  @override
  State<CheckBoxTest> createState() => _CheckBoxTestState();
}

class _CheckBoxTestState extends State<CheckBoxTest> {
  bool value = false;
  bool isDisable = false;
  bool isError = false;
  bool tristate = false;

  @override
  Widget build(BuildContext context) {
    return M3Padding(
      padding: const M3EdgeInsets.only(bottom: M3Spacing.regular),
      child: M3Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _checkBoxView(
                tristate: tristate,
                isError: isError,
                value: tristate ? null : value,
                onChanged: isDisable == true
                    ? null
                    : (val) {
                        setState(() {
                          value = val!;
                        });
                      }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    M3CheckBox(
                        value: isDisable,
                        onChanged: (val) => setState(() => isDisable = val!)),
                    const M3Text.bodyMedium(text: 'Disable'),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    M3CheckBox(
                        value: isError,
                        onChanged: (val) => setState(() => isError = val!)),
                    const M3Text.bodyMedium(text: 'Error'),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    M3CheckBox(
                        value: tristate,
                        onChanged: (val) => setState(() => tristate = val!)),
                    const M3Text.bodyMedium(text: 'Tristate')
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
