import 'package:flutter/material.dart';
import 'package:flutter_m3_core/src/m3_components/m3_device_layout/m3_device_enum.dart';
export 'package:flutter_m3_core/src/m3_components/m3_device_layout/m3_device_enum.dart';
// check is web
import 'package:flutter/foundation.dart' show kIsWeb;

// Import Platform
import 'dart:io' show Platform;



final class M3ViewLayout extends StatelessWidget {
  final Widget mobile;
  final Widget desktop;
  final Widget tablet;
  const M3ViewLayout({
    super.key,
    this.mobile = const _M3EmptyWidget(deviceEmpty: "Mobile"),
    this.desktop = const _M3EmptyWidget(deviceEmpty: "Desktop"),
    this.tablet = const _M3EmptyWidget(deviceEmpty: "Tablet"),
  });

  @override
  Widget build(BuildContext context) {
    M3ViewType m3ViewType = M3ViewService.m3ViewType;
    if(kIsWeb || (!Platform.isAndroid && !Platform.isIOS)){
      m3ViewType = M3ViewService.getViewType(context);
    }
    return OrientationBuilder(
        builder: (context, orientation) => switch (m3ViewType) {
              M3ViewType.tablet => tablet,
              M3ViewType.desktop => desktop,
              M3ViewType.mobile => mobile,
            });
  }
}

class _M3EmptyWidget extends StatelessWidget {
  final String deviceEmpty;
  const _M3EmptyWidget({required this.deviceEmpty});

  @override
  Widget build(BuildContext context) =>
      Scaffold(body: Center(child: Text(deviceEmpty)));
}
