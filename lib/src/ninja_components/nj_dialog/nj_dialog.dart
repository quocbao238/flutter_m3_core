import 'package:flutter/material.dart';

class NJDialog {
  static Future<T?> showBasicDialog<T>({
    required BuildContext context,
    String? title,
    String? content,
    List<Widget>? actions,
    Widget? child,
  }) async {
    assert(child != null || content != null, 'You must use one of "Content" or "Child"');
    assert(child == null || content == null, 'You can only use one of "Content" or "Child"');
    return await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) =>
          AlertDialog(title: title == null ? null : Text(title), content: child ?? Text(content!), actions: actions),
    );
  }

  static Future<T?> showIconsDialog<T>(
      {required IconData icon,
      required BuildContext context,
      String? title,
      String? content,
      Widget? child,
      List<Widget>? actions}) async {
    assert(child != null || content != null, 'You must use one of "Content" or "Child"');
    assert(child == null || content == null, 'You can only use one of "Content" or "Child"');
    return await showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) => AlertDialog(
          icon: Icon(icon),
          title: title == null ? null : Text(title),
          content: child ?? Text(content!),
          actions: actions),
    );
  }
}
