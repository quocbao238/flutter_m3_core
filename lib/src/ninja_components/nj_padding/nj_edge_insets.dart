import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ninja_core/src/ninja_components/nj_gap/nj_gap_enum.dart';

class NjEdgeInsets extends Equatable {
  final NjGapSize left;
  final NjGapSize top;
  final NjGapSize right;
  final NjGapSize bottom;

  const NjEdgeInsets.all(NjGapSize value)
      : left = value,
        top = value,
        right = value,
        bottom = value;

  const NjEdgeInsets.symmetric({
    NjGapSize vertical = NjGapSize.none,
    NjGapSize horizontal = NjGapSize.none,
  })  : left = horizontal,
        top = vertical,
        right = horizontal,
        bottom = vertical;

  const NjEdgeInsets.only({
    this.left = NjGapSize.none,
    this.top = NjGapSize.none,
    this.right = NjGapSize.none,
    this.bottom = NjGapSize.none,
  });

  const NjEdgeInsets.small()
      : left = NjGapSize.small,
        top = NjGapSize.small,
        right = NjGapSize.small,
        bottom = NjGapSize.small;

  const NjEdgeInsets.medium()
      : left = NjGapSize.medium,
        top = NjGapSize.medium,
        right = NjGapSize.medium,
        bottom = NjGapSize.medium;

  const NjEdgeInsets.regular()
      : left = NjGapSize.regular,
        top = NjGapSize.regular,
        right = NjGapSize.regular,
        bottom = NjGapSize.regular;

  const NjEdgeInsets.large()
      : left = NjGapSize.large,
        top = NjGapSize.large,
        right = NjGapSize.large,
        bottom = NjGapSize.large;

  const NjEdgeInsets.veryLarge()
      : left = NjGapSize.veryLarge,
        top = NjGapSize.veryLarge,
        right = NjGapSize.veryLarge,
        bottom = NjGapSize.veryLarge;

  EdgeInsets toEdgeInsets() => EdgeInsets.only(
      left: left.size, top: top.size, right: right.size, bottom: bottom.size);

  @override
  List<Object?> get props => [left, top, right, bottom];
}
