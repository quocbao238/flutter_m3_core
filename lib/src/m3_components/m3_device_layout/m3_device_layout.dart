import 'package:flutter/material.dart';
import 'package:ninja_core/src/m3_components/m3_device_layout/m3_device_enum.dart';

// M3 Device Layout use MediaQuery size to check
// Return empty widget if device type not match
final class M3DeviceLayout extends StatelessWidget {
  final Widget mobile;
  final Widget desktop;
  final Widget tablet;
  const M3DeviceLayout(
      {super.key,
      this.mobile = const _M3EmptyWidget(deviceEmpty: "Mobile"),
      this.desktop = const _M3EmptyWidget(deviceEmpty: "Desktop"),
      this.tablet = const _M3EmptyWidget(deviceEmpty: "Tablet")});

  @override
  Widget build(BuildContext context) => OrientationBuilder(
      builder: (context, orientation) => switch (M3DeviceService.deviceType) {
            M3DeviceType.tablet => tablet,
            M3DeviceType.desktop => desktop,
            M3DeviceType.mobile => mobile
          });
}

class _M3EmptyWidget extends StatelessWidget {
  final String deviceEmpty;
  const _M3EmptyWidget({required this.deviceEmpty});

  @override
  Widget build(BuildContext context) =>
      Scaffold(body: Center(child: Text(deviceEmpty)));
}
