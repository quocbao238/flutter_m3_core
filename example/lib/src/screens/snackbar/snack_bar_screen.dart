// ignore_for_file: avoid_print

import 'package:example/src/screens/widgets/custom_app_bar.dart';
import 'package:example/src/screens/widgets/custom_header_content_web.dart';
import 'package:flutter/material.dart';
import 'package:flutter_m3_core/m3_theme_core.dart';

class SnackBarScreen extends StatelessWidget {
  const SnackBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (M3DeviceService.isDesktop() || M3DeviceService.isWeb()) {
      return CustomContentHeaderWeb(title: 'SnackBar', child: _body(context));
    }

    return Scaffold(
      appBar: const CustomAppBar(title: 'SnackBar'),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: M3Spacing.medium.size),
      children: [
        M3Button.filled(
            text: 'Show SnackBar',
            onPressed: () =>
                _showSnackBar(context, content: 'Single-line snackbar')),
        const M3Space.medium(),
        M3Button.filledTonal(
            text: 'Snack bar with close affordance',
            onPressed: () => _showSnackBar(context,
                showCloseIcon: true,
                content: 'Single-line snackbar with close affordance')),
        const M3Space.medium(),
        M3Button.filled(
            text: 'Show SnackBar with action',
            onPressed: () => _showSnackBar(context,
                content: 'Single-line snackbar with action')),
        const M3Space.medium(),
        M3Button.filledTonal(
            text: 'Show SnackBar with action close',
            onPressed: () => _showSnackBar(context,
                showCloseIcon: true,
                label: 'Action',
                onPressed: () => print('Action pressed'),
                content: 'Single-line snackbar with action')),
        const M3Space.medium(),
        M3Button.filled(
            text: 'Two-line snackbar without action',
            onPressed: () => _showSnackBar(context,
                content: 'Two-line snackbar\nwithout action')),
        const M3Space.medium(),
        M3Button.filledTonal(
            text: 'Two-line snackbar with close affordance',
            onPressed: () => _showSnackBar(context,
                showCloseIcon: true,
                content: 'Two-line snackbar\nclose affordance')),
        const M3Space.medium(),
        M3Button.filled(
            text: 'Two-line snackbar with action',
            onPressed: () => _showSnackBar(context,
                label: 'Action',
                onPressed: () => print('Action pressed'),
                content: 'Two-line snackbar\nwith action')),
        const M3Space.medium(),
        M3Button.filledTonal(
            text: 'Two-line snackbar with action and close affordance',
            onPressed: () => _showSnackBar(context,
                label: 'Action',
                showCloseIcon: true,
                onPressed: () => print('Action pressed'),
                content:
                    'Two-line snackbar\nwith action and close affordance')),
      ],
    );
  }

  void _showSnackBar(BuildContext context,
      {required String content,
      String? label,
      VoidCallback? onPressed,
      bool showCloseIcon = false}) {
    assert(label != null || onPressed == null,
        'Cannot provide onPressed without a label.');
    assert(label == null || onPressed != null,
        'Cannot provide a label without onPressed.');

    final SnackBarAction? action = label == null
        ? null
        : SnackBarAction(label: label, onPressed: onPressed!);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(content), action: action, showCloseIcon: showCloseIcon),
    );
  }
}
