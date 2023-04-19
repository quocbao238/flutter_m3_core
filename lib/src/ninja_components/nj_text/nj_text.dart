import 'package:flutter/material.dart';
import 'package:ninja_core/src/ninja_components/nj_text/n_text_enum.dart';

class NJText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final Color? color;
  final int? maxLines;
  final NJTextStyle _njTextStyle;
  final TextOverflow? overflow;

  const NJText.displayLarge(
      {super.key,
      required this.text,
      this.textAlign,
      this.fontWeight,
      this.color,
      this.maxLines,
      this.overflow})
      : _njTextStyle = NJTextStyle.displayLarge;

  const NJText.displayMedium(
      {super.key,
      required this.text,
      this.textAlign,
      this.fontWeight,
      this.color,
      this.maxLines,
      this.overflow})
      : _njTextStyle = NJTextStyle.displayMedium;

  const NJText.displaySmall(
      {super.key,
      required this.text,
      this.textAlign,
      this.fontWeight,
      this.color,
      this.maxLines,
      this.overflow})
      : _njTextStyle = NJTextStyle.displaySmall;

  const NJText.headlineLarge(
      {super.key,
      required this.text,
      this.textAlign,
      this.fontWeight,
      this.color,
      this.maxLines,
      this.overflow})
      : _njTextStyle = NJTextStyle.headlineLarge;

  const NJText.headlineMedium(
      {super.key,
      required this.text,
      this.textAlign,
      this.fontWeight,
      this.color,
      this.maxLines,
      this.overflow})
      : _njTextStyle = NJTextStyle.headlineMedium;

  const NJText.headlineSmall(
      {super.key,
      required this.text,
      this.textAlign,
      this.fontWeight,
      this.color,
      this.maxLines,
      this.overflow})
      : _njTextStyle = NJTextStyle.headlineSmall;

  const NJText.titleLarge(
      {super.key,
      required this.text,
      this.textAlign,
      this.fontWeight,
      this.color,
      this.maxLines,
      this.overflow})
      : _njTextStyle = NJTextStyle.titleLarge;

  const NJText.titleMedium(
      {super.key,
      required this.text,
      this.textAlign,
      this.fontWeight,
      this.color,
      this.maxLines,
      this.overflow})
      : _njTextStyle = NJTextStyle.titleMedium;

  const NJText.titleSmall(
      {super.key,
      required this.text,
      this.textAlign,
      this.fontWeight,
      this.color,
      this.maxLines,
      this.overflow})
      : _njTextStyle = NJTextStyle.titleSmall;

  const NJText.labelLarge(
      {super.key,
      required this.text,
      this.textAlign,
      this.fontWeight,
      this.color,
      this.maxLines,
      this.overflow})
      : _njTextStyle = NJTextStyle.labelLarge;

  const NJText.labelMedium(
      {super.key,
      required this.text,
      this.textAlign,
      this.fontWeight,
      this.color,
      this.maxLines,
      this.overflow})
      : _njTextStyle = NJTextStyle.labelMedium;

  const NJText.labelSmall(
      {super.key,
      required this.text,
      this.textAlign,
      this.fontWeight,
      this.color,
      this.maxLines,
      this.overflow})
      : _njTextStyle = NJTextStyle.labelSmall;

  const NJText.bodyLarge(
      {super.key,
      required this.text,
      this.textAlign,
      this.fontWeight,
      this.color,
      this.maxLines,
      this.overflow})
      : _njTextStyle = NJTextStyle.bodyLarge;

  const NJText.bodyMedium(
      {super.key,
      required this.text,
      this.textAlign,
      this.fontWeight,
      this.color,
      this.maxLines,
      this.overflow})
      : _njTextStyle = NJTextStyle.bodyMedium;

  const NJText.bodySmall(
      {super.key,
      required this.text,
      this.textAlign,
      this.fontWeight,
      this.color,
      this.maxLines,
      this.overflow})
      : _njTextStyle = NJTextStyle.bodySmall;

  @override
  Widget build(BuildContext context) {
    final textStyle = NjTextHelper.getStyleByNJTextStyle(
        njTextStyle: _njTextStyle, context: context);
    return Text(text,
        textAlign: textAlign ?? TextAlign.center,
        overflow: overflow,
        maxLines: maxLines,
        style: textStyle.copyWith(
            fontWeight: fontWeight, color: color ?? textStyle.color));
  }
}
