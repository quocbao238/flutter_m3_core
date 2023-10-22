import 'package:flutter/material.dart';
import 'package:flutter_m3_core/m3_theme_core.dart';

class M3AppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? customTitle;
  final Widget? leading;
  final List<Widget>? actions;
  final Widget? flexibleSpace;
  final PreferredSizeWidget? bottom;
  final Color? backgroundColor;
  final Color? shadowColor;
  final bool? centerTitle;

  const M3AppBar(
      {super.key,
      required this.title,
      this.leading,
      this.actions,
      this.flexibleSpace,
      this.bottom,
      this.customTitle,
      this.centerTitle = true,
      this.backgroundColor,
      this.shadowColor});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
      backgroundColor: backgroundColor ?? Theme.of(context).colorScheme.primary,
      centerTitle: centerTitle,
      shadowColor: shadowColor ?? Theme.of(context).colorScheme.shadow,
      title: customTitle ?? M3Text.headlineSmall(text: title, color: Theme.of(context).colorScheme.onPrimary),
      leading: leading,
      actions: actions,
      flexibleSpace: flexibleSpace,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
