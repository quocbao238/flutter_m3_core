import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ninja_core/src/m3_components/m3_spacing/m3_spacing_enum.dart';

class M3EdgeInsets extends Equatable {
  final M3Spacing left;
  final M3Spacing top;
  final M3Spacing right;
  final M3Spacing bottom;

  const M3EdgeInsets.all(M3Spacing value)
      : left = value,
        top = value,
        right = value,
        bottom = value;

  const M3EdgeInsets.symmetric({
    M3Spacing vertical = M3Spacing.none,
    M3Spacing horizontal = M3Spacing.none,
  })  : left = horizontal,
        top = vertical,
        right = horizontal,
        bottom = vertical;

  const M3EdgeInsets.only({
    this.left = M3Spacing.none,
    this.top = M3Spacing.none,
    this.right = M3Spacing.none,
    this.bottom = M3Spacing.none,
  });

  const M3EdgeInsets.small()
      : left = M3Spacing.small,
        top = M3Spacing.small,
        right = M3Spacing.small,
        bottom = M3Spacing.small;

  const M3EdgeInsets.medium()
      : left = M3Spacing.medium,
        top = M3Spacing.medium,
        right = M3Spacing.medium,
        bottom = M3Spacing.medium;

  const M3EdgeInsets.regular()
      : left = M3Spacing.regular,
        top = M3Spacing.regular,
        right = M3Spacing.regular,
        bottom = M3Spacing.regular;

  const M3EdgeInsets.large()
      : left = M3Spacing.large,
        top = M3Spacing.large,
        right = M3Spacing.large,
        bottom = M3Spacing.large;

  const M3EdgeInsets.veryLarge()
      : left = M3Spacing.veryLarge,
        top = M3Spacing.veryLarge,
        right = M3Spacing.veryLarge,
        bottom = M3Spacing.veryLarge;

  const M3EdgeInsets.none()
      : left = M3Spacing.none,
        top = M3Spacing.none,
        right = M3Spacing.none,
        bottom = M3Spacing.none;

  EdgeInsets toEdgeInsets() => EdgeInsets.only(
      left: left.size, top: top.size, right: right.size, bottom: bottom.size);

  @override
  List<Object?> get props => [left, top, right, bottom];
}
