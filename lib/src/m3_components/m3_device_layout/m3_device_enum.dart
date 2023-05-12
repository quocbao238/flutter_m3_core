// ignore_for_file: deprecated_member_use

import 'dart:ui' as ui;

enum M3DeviceType { tablet, mobile, desktop }

final class M3DeviceService {
  static M3DeviceType deviceType = M3DeviceType.mobile;
  static double devicePixelRatio = ui.window.devicePixelRatio;
  static ui.Size size = ui.window.physicalSize;
  static init() {
    if (size.shortestSide < 600) {
      return deviceType = M3DeviceType.mobile;
    }
    if (size.shortestSide < 900) {
      return deviceType = M3DeviceType.tablet;
    }
    return deviceType = M3DeviceType.desktop;
  }
}
