import 'package:flutter/material.dart';
import 'package:flutter_m3_core/src/m3_components/m3_spacing/m3_spacing_enum.dart';

export 'package:flutter_m3_core/src/m3_components/m3_spacing/m3_spacing_enum.dart';

class M3Space extends StatelessWidget {
  final M3Spacing? width;
  final M3Spacing? height;
  const M3Space({Key? key, this.width, this.height}) : super(key: key);

  const M3Space.small({Key? key})
      : width = M3Spacing.small,
        height = M3Spacing.small,
        super(key: key);

  const M3Space.medium({Key? key})
      : width = M3Spacing.medium,
        height = M3Spacing.medium,
        super(key: key);

  const M3Space.regular({Key? key})
      : width = M3Spacing.regular,
        height = M3Spacing.regular,
        super(key: key);

  const M3Space.large({Key? key})
      : width = M3Spacing.large,
        height = M3Spacing.large,
        super(key: key);

  const M3Space.veryLarge({Key? key})
      : width = M3Spacing.veryLarge,
        height = M3Spacing.veryLarge,
        super(key: key);

  const M3Space.customized({Key? key, this.width, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) =>
      SizedBox(width: width?.size, height: height?.size);
}
