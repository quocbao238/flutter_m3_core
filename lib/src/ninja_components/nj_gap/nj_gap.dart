import 'package:flutter/material.dart';
import 'package:ninja_core/src/ninja_components/nj_gap/nj_gap_enum.dart';

export 'package:ninja_core/src/ninja_components/nj_gap/nj_gap_enum.dart';

class NJGap extends StatelessWidget {
  final NJGapSize? width;
  final NJGapSize? height;

  const NJGap({Key? key, this.width, this.height}) : super(key: key);

  const NJGap.small({Key? key})
      : width = NJGapSize.small,
        height = NJGapSize.small,
        super(key: key);

  const NJGap.medium({Key? key})
      : width = NJGapSize.medium,
        height = NJGapSize.medium,
        super(key: key);

  const NJGap.regular({Key? key})
      : width = NJGapSize.regular,
        height = NJGapSize.regular,
        super(key: key);

  const NJGap.large({Key? key})
      : width = NJGapSize.large,
        height = NJGapSize.large,
        super(key: key);

  const NJGap.veryLarge({Key? key})
      : width = NJGapSize.veryLarge,
        height = NJGapSize.veryLarge,
        super(key: key);

  @override
  Widget build(BuildContext context) =>
      SizedBox(width: width?.size, height: height?.size);
}
