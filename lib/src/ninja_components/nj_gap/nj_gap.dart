import 'package:flutter/material.dart';
import 'package:ninja_core/src/ninja_components/nj_gap/nj_gap_enum.dart';

class NjGap extends StatelessWidget {
  final NjGapSize? width;
  final NjGapSize? height;

  const NjGap({Key? key, this.width, this.height}) : super(key: key);

  const NjGap.small({Key? key})
      : width = NjGapSize.small,
        height = NjGapSize.small,
        super(key: key);

  const NjGap.medium({Key? key})
      : width = NjGapSize.medium,
        height = NjGapSize.medium,
        super(key: key);

  const NjGap.regular({Key? key})
      : width = NjGapSize.regular,
        height = NjGapSize.regular,
        super(key: key);

  const NjGap.large({Key? key})
      : width = NjGapSize.large,
        height = NjGapSize.large,
        super(key: key);

  const NjGap.veryLarge({Key? key})
      : width = NjGapSize.veryLarge,
        height = NjGapSize.veryLarge,
        super(key: key);

  @override
  Widget build(BuildContext context) =>
      SizedBox(width: width?.size, height: height?.size);
}
