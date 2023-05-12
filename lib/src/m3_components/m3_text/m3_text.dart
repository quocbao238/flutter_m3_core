import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ninja_core/src/m3_components/m3_text/m3_text_enum.dart';

class NJText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final Color? color;
  final int? maxLines;
  final M3TextStyle _njTextStyle;
  final TextOverflow? overflow;

  const NJText.displayLarge(
      {super.key,
      required this.text,
      this.textAlign,
      this.fontWeight,
      this.color,
      this.maxLines,
      this.overflow})
      : _njTextStyle = M3TextStyle.displayLarge;

  const NJText.displayMedium(
      {super.key,
      required this.text,
      this.textAlign,
      this.fontWeight,
      this.color,
      this.maxLines,
      this.overflow})
      : _njTextStyle = M3TextStyle.displayMedium;

  const NJText.displaySmall(
      {super.key,
      required this.text,
      this.textAlign,
      this.fontWeight,
      this.color,
      this.maxLines,
      this.overflow})
      : _njTextStyle = M3TextStyle.displaySmall;

  const NJText.headlineLarge(
      {super.key,
      required this.text,
      this.textAlign,
      this.fontWeight,
      this.color,
      this.maxLines,
      this.overflow})
      : _njTextStyle = M3TextStyle.headlineLarge;

  const NJText.headlineMedium(
      {super.key,
      required this.text,
      this.textAlign,
      this.fontWeight,
      this.color,
      this.maxLines,
      this.overflow})
      : _njTextStyle = M3TextStyle.headlineMedium;

  const NJText.headlineSmall(
      {super.key,
      required this.text,
      this.textAlign,
      this.fontWeight,
      this.color,
      this.maxLines,
      this.overflow})
      : _njTextStyle = M3TextStyle.headlineSmall;

  const NJText.titleLarge(
      {super.key,
      required this.text,
      this.textAlign,
      this.fontWeight,
      this.color,
      this.maxLines,
      this.overflow})
      : _njTextStyle = M3TextStyle.titleLarge;

  const NJText.titleMedium(
      {super.key,
      required this.text,
      this.textAlign,
      this.fontWeight,
      this.color,
      this.maxLines,
      this.overflow})
      : _njTextStyle = M3TextStyle.titleMedium;

  const NJText.titleSmall(
      {super.key,
      required this.text,
      this.textAlign,
      this.fontWeight,
      this.color,
      this.maxLines,
      this.overflow})
      : _njTextStyle = M3TextStyle.titleSmall;

  const NJText.labelLarge(
      {super.key,
      required this.text,
      this.textAlign,
      this.fontWeight,
      this.color,
      this.maxLines,
      this.overflow})
      : _njTextStyle = M3TextStyle.labelLarge;

  const NJText.labelMedium(
      {super.key,
      required this.text,
      this.textAlign,
      this.fontWeight,
      this.color,
      this.maxLines,
      this.overflow})
      : _njTextStyle = M3TextStyle.labelMedium;

  const NJText.labelSmall(
      {super.key,
      required this.text,
      this.textAlign,
      this.fontWeight,
      this.color,
      this.maxLines,
      this.overflow})
      : _njTextStyle = M3TextStyle.labelSmall;

  const NJText.bodyLarge(
      {super.key,
      required this.text,
      this.textAlign,
      this.fontWeight,
      this.color,
      this.maxLines,
      this.overflow})
      : _njTextStyle = M3TextStyle.bodyLarge;

  const NJText.bodyMedium(
      {super.key,
      required this.text,
      this.textAlign,
      this.fontWeight,
      this.color,
      this.maxLines,
      this.overflow})
      : _njTextStyle = M3TextStyle.bodyMedium;

  const NJText.bodySmall(
      {super.key,
      required this.text,
      this.textAlign,
      this.fontWeight,
      this.color,
      this.maxLines,
      this.overflow})
      : _njTextStyle = M3TextStyle.bodySmall;

  @override
  Widget build(BuildContext context) {
    final textStyle = _njTextStyle.getTextStyle(context);
    return AutoSizeText(
      text,
      textAlign: textAlign ?? TextAlign.center,
      overflow: overflow,
      maxLines: maxLines,
      style: textStyle.copyWith(
          fontWeight: fontWeight, color: color ?? textStyle.color),
    );
  }
}
