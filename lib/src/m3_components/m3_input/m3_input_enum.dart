import 'package:flutter/material.dart';

enum M3InputEnum {
  underline,
  outline,
  filled,
  filledOutlinel;

  InputBorder getInputBorder(BorderRadius? borderRadius) {
    return switch (this) {
      M3InputEnum.underline => const UnderlineInputBorder(),
      M3InputEnum.outline =>
        borderRadius != null ? OutlineInputBorder(borderRadius: borderRadius) : const OutlineInputBorder(),
      M3InputEnum.filled =>
        borderRadius != null ? OutlineInputBorder(borderRadius: borderRadius) : const OutlineInputBorder(),
      M3InputEnum.filledOutlinel =>
        borderRadius != null ? OutlineInputBorder(borderRadius: borderRadius) : const OutlineInputBorder(),
    };
  }
}
