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
        ));
  }

  _checkBoxView(
      {bool? value,
      Function(bool?)? onChanged,
      bool? isError,
      bool? tristate}) {
    String getStrByFunction() =>
        'NJCheckBox {value = $value, onChanged = $onChanged, isError = $isError, tristate = $tristate}';

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
}
