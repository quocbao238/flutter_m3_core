import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ninja_core/src/m3_components/m3_text/m3_text_enum.dart';

class M3Text extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final Color? color;
  final int? maxLines;
  final M3TextStyle _m3TextStyle;
  final TextOverflow? overflow;
  final bool isFlexible;

  const M3Text.displayLarge(
      {super.key,
      required this.text,
      this.textAlign,
      this.fontWeight,
      this.color,
      this.isFlexible = true,
      this.maxLines,
      this.overflow})
      : _m3TextStyle = M3TextStyle.displayLarge;

  const M3Text.displayMedium(
      {super.key,
      required this.text,
      this.textAlign,
      this.fontWeight,
      this.isFlexible = true,
      this.color,
      this.maxLines,
      this.overflow})
      : _m3TextStyle = M3TextStyle.displayMedium;

  const M3Text.displaySmall(
      {super.key,
      required this.text,
      this.textAlign,
      this.fontWeight,
      this.isFlexible = true,
      this.color,
      this.maxLines,
      this.overflow})
      : _m3TextStyle = M3TextStyle.displaySmall;

  const M3Text.headlineLarge(
      {super.key,
      required this.text,
      this.textAlign,
      this.isFlexible = true,
      this.fontWeight,
      this.color,
      this.maxLines,
      this.overflow})
      : _m3TextStyle = M3TextStyle.headlineLarge;

  const M3Text.headlineMedium(
      {super.key,
      required this.text,
      this.textAlign,
      this.fontWeight,
      this.color,
      this.isFlexible = true,
      this.maxLines,
      this.overflow})
      : _m3TextStyle = M3TextStyle.headlineMedium;

  const M3Text.headlineSmall(
      {super.key,
      required this.text,
      this.textAlign,
      this.fontWeight,
      this.isFlexible = true,
      this.color,
      this.maxLines,
      this.overflow})
      : _m3TextStyle = M3TextStyle.headlineSmall;

  const M3Text.titleLarge(
      {super.key,
      required this.text,
      this.textAlign,
      this.isFlexible = true,
      this.fontWeight,
      this.color,
      this.maxLines,
      this.overflow})
      : _m3TextStyle = M3TextStyle.titleLarge;

  const M3Text.titleMedium(
      {super.key,
      required this.text,
      this.textAlign,
      this.fontWeight,
      this.isFlexible = true,
      this.color,
      this.maxLines,
      this.overflow})
      : _m3TextStyle = M3TextStyle.titleMedium;

  const M3Text.titleSmall(
      {super.key,
      required this.text,
      this.textAlign,
      this.isFlexible = true,
      this.fontWeight,
      this.color,
      this.maxLines,
      this.overflow})
      : _m3TextStyle = M3TextStyle.titleSmall;

  const M3Text.labelLarge(
      {super.key,
      required this.text,
      this.isFlexible = true,
      this.textAlign,
      this.fontWeight,
      this.color,
      this.maxLines,
      this.overflow})
      : _m3TextStyle = M3TextStyle.labelLarge;

  const M3Text.labelMedium(
      {super.key,
      required this.text,
      this.isFlexible = true,
      this.textAlign,
      this.fontWeight,
      this.color,
      this.maxLines,
      this.overflow})
      : _m3TextStyle = M3TextStyle.labelMedium;

  const M3Text.labelSmall(
      {super.key,
      required this.text,
      this.isFlexible = true,
      this.textAlign,
      this.fontWeight,
      this.color,
      this.maxLines,
      this.overflow})
      : _m3TextStyle = M3TextStyle.labelSmall;

  const M3Text.bodyLarge(
      {super.key,
      required this.text,
      this.textAlign,
      this.fontWeight,
      this.isFlexible = true,
      this.color,
      this.maxLines,
      this.overflow})
      : _m3TextStyle = M3TextStyle.bodyLarge;

  const M3Text.bodyMedium(
      {super.key,
      required this.text,
      this.isFlexible = true,
      this.textAlign,
      this.fontWeight,
      this.color,
      this.maxLines,
      this.overflow})
      : _m3TextStyle = M3TextStyle.bodyMedium;

  const M3Text.bodySmall(
      {super.key,
      required this.text,
      this.textAlign,
      this.isFlexible = true,
      this.fontWeight,
      this.color,
      this.maxLines,
      this.overflow})
      : _m3TextStyle = M3TextStyle.bodySmall;

  @override
  Widget build(BuildContext context) {
    final textStyle = _m3TextStyle.getTextStyle(context);

    if (!isFlexible) {
      return Text(text,
          textAlign: textAlign ?? TextAlign.center,
          overflow: overflow,
          maxLines: maxLines,
          style: textStyle.copyWith(
              fontWeight: fontWeight, color: color ?? textStyle.color));
    }

    return AutoSizeText(text,
        textAlign: textAlign ?? TextAlign.center,
        overflow: overflow,
        maxLines: maxLines,
        style: textStyle.copyWith(
            fontWeight: fontWeight, color: color ?? textStyle.color));
  }
}
