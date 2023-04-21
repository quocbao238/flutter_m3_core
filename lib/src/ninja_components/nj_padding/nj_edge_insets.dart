import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ninja_core/src/ninja_components/nj_gap/nj_gap_enum.dart';

class NJEdgeInsets extends Equatable {
  final NJGapSize left;
  final NJGapSize top;
  final NJGapSize right;
  final NJGapSize bottom;

  const NJEdgeInsets.all(NJGapSize value)
      : left = value,
        top = value,
        right = value,
        bottom = value;

  const NJEdgeInsets.symmetric({
    NJGapSize vertical = NJGapSize.none,
    NJGapSize horizontal = NJGapSize.none,
  })  : left = horizontal,
        top = vertical,
        right = horizontal,
        bottom = vertical;

  const NJEdgeInsets.only({
    this.left = NJGapSize.none,
    this.top = NJGapSize.none,
    this.right = NJGapSize.none,
    this.bottom = NJGapSize.none,
  });

  const NJEdgeInsets.small()
      : left = NJGapSize.small,
        top = NJGapSize.small,
        right = NJGapSize.small,
        bottom = NJGapSize.small;

  const NJEdgeInsets.medium()
      : left = NJGapSize.medium,
        top = NJGapSize.medium,
        right = NJGapSize.medium,
        bottom = NJGapSize.medium;

  const NJEdgeInsets.regular()
      : left = NJGapSize.regular,
        top = NJGapSize.regular,
        right = NJGapSize.regular,
        bottom = NJGapSize.regular;

  const NJEdgeInsets.large()
      : left = NJGapSize.large,
        top = NJGapSize.large,
        right = NJGapSize.large,
        bottom = NJGapSize.large;

  const NJEdgeInsets.veryLarge()
      : left = NJGapSize.veryLarge,
        top = NJGapSize.veryLarge,
        right = NJGapSize.veryLarge,
        bottom = NJGapSize.veryLarge;

  const NJEdgeInsets.none()
      : left = NJGapSize.none,
        top = NJGapSize.none,
        right = NJGapSize.none,
        bottom = NJGapSize.none;

  EdgeInsets toEdgeInsets() => EdgeInsets.only(
      left: left.size, top: top.size, right: right.size, bottom: bottom.size);

  @override
  List<Object?> get props => [left, top, right, bottom];
}
