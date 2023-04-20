import 'dart:core';

import 'package:example/src/screens/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:ninja_core/ninja_core.dart';

class CheckBoxScreen extends StatelessWidget {
  const CheckBoxScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Ninja CheckBox'),
      body: NJPadding.medium(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CheckBoxTest(),
              NJCard(
                  // width: 1280 / 3.2,
                  child: Wrap(
                spacing: NJGapSize.regular.size,
                runSpacing: NJGapSize.regular.size,
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.center,
                children: [
                  _checkBoxView(value: true, onChanged: (val) {}),
                  _checkBoxView(value: true),
                  _checkBoxView(value: false, onChanged: (val) {}),
                  _checkBoxView(value: false),
                  const NJDivider(),
                  _checkBoxView(
                      value: true, onChanged: (val) {}, isError: true),
                  _checkBoxView(value: true),
                  _checkBoxView(
                      value: false, onChanged: (val) {}, isError: true),
                  _checkBoxView(value: false),
                  const NJDivider(),
                  _checkBoxView(
                      value: null, onChanged: (val) {}, tristate: true),
                  _checkBoxView(value: null, tristate: true),
                  _checkBoxView(
                      value: null, onChanged: (val) {}, tristate: true),
                  _checkBoxView(value: null, tristate: true),
                  const NJDivider(),
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
        ),
      ),
    );
  }
}

Widget _checkBoxView(
    {bool? value, Function(bool?)? onChanged, bool? isError, bool? tristate}) {
  String getStrByFunction() =>
      'NJCheckBox {value = $value, status = ${onChanged != null ? 'enable' : 'disable'}, isError = $isError, tristate = $tristate}';

  return Row(
    children: [
      NJCheckBox(
          value: value,
          onChanged: onChanged,
          isError: isError,
          tristate: tristate),
      Expanded(
          child: NJText.bodyMedium(
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
    return NJPadding(
      padding: const NJEdgeInsets.only(bottom: NJGapSize.regular),
      child: NJCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _checkBoxView(
                tristate: tristate,
                isError: isError,
                value: tristate ? null : value,
                onChanged: isDisable == false
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
                    NJCheckBox(
                        value: isDisable,
                        onChanged: (val) => setState(() => isDisable = val!)),
                    const NJText.bodyMedium(text: 'Disable'),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    NJCheckBox(
                        value: isError,
                        onChanged: (val) => setState(() => isError = val!)),
                    const NJText.bodyMedium(text: 'Error'),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    NJCheckBox(
                        value: tristate,
                        onChanged: (val) => setState(() => tristate = val!)),
                    const NJText.bodyMedium(text: 'Tristate'),
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
