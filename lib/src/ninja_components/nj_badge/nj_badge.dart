import 'package:flutter/material.dart';

/// Badges are used to convey dynamic information,
/// such as a count or status. A badge can include text, labels, or numbers.
///
class NJBadge extends StatelessWidget {
  final int count;
  final Widget? child;
  final IconData? iconData;

  const NJBadge({Key? key, this.child, required this.count, this.iconData})
      : assert(child != null || iconData != null,
            'You forgot to use either "Child" or "iconData"'),
        assert(child == null || iconData == null,
            'You must use only one of "Child" or "iconData"'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Badge.count(
      backgroundColor: scheme.primary.withOpacity(0.8),
      count: count,
      child: child ?? Icon(iconData),
    );
  }
}
