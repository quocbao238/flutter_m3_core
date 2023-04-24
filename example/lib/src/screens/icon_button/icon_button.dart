import 'package:example/src/screens/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:ninja_core/ninja_core.dart';

class IconButtonScreen extends StatefulWidget {
  const IconButtonScreen({Key? key}) : super(key: key);

  @override
  State<IconButtonScreen> createState() => _IconButtonScreenState();
}

class _IconButtonScreenState extends State<IconButtonScreen> {
  bool isEnable = true;

  onChangeEnable() => setState(() => isEnable = !isEnable);

  @override
  Widget build(BuildContext context) {
    final Function()? onPressed = isEnable ? () {} : null;
    return Scaffold(
      appBar: const CustomAppBar(title: 'Ninja Icon Button'),
      body: NJPadding.medium(
        child: NJCard(
          child: NJPadding.medium(
            child: ListView(
              shrinkWrap: true,
              children: [
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    Row(
                      children: [
                        NjIconButton(icon: Icons.settings, onPressed: onPressed),
                        NJPadding(
                          padding: const NJEdgeInsets.symmetric(horizontal: NJGapSize.medium),
                          child: NJText.titleSmall(text: 'IconButton (normal)', color: isEnable ? Colors.red : null),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        NjIconButton.filled(icon: Icons.settings, onPressed: onPressed),
                        NJPadding(
                            padding: const NJEdgeInsets.symmetric(horizontal: NJGapSize.medium),
                            child: NJText.titleSmall(text: 'IconButton (filled)', color: isEnable ? Colors.red : null)),
                      ],
                    ),
                    Row(
                      children: [
                        NjIconButton.filledTonal(icon: Icons.settings, onPressed: onPressed),
                        NJPadding(
                            padding: const NJEdgeInsets.symmetric(horizontal: NJGapSize.medium),
                            child: NJText.titleSmall(
                                text: 'IconButton (filledTonal)', color: isEnable ? Colors.red : null)),
                      ],
                    ),
                    Row(
                      children: [
                        NjIconButton.outlined(icon: Icons.settings, onPressed: onPressed),
                        NJPadding(
                            padding: const NJEdgeInsets.symmetric(horizontal: NJGapSize.medium),
                            child:
                                NJText.titleSmall(text: 'IconButton (outlined)', color: isEnable ? Colors.red : null)),
                      ],
                    ),
                    Row(
                      children: [
                        NjIconButton.filledTertiary(icon: Icons.settings, onPressed: onPressed),
                        NJPadding(
                            padding: const NJEdgeInsets.symmetric(horizontal: NJGapSize.medium),
                            child: NJText.titleSmall(
                                text: 'IconButton (filledTertiary)', color: isEnable ? Colors.red : null)),
                      ],
                    ),
                  ],
                ),
                const NJGap.medium(),
                NJButton.outline(onPressed: onChangeEnable, child: Text(isEnable ? 'Disable' : 'Enable')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
