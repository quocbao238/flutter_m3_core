// ignore_for_file: deprecated_member_use

import 'dart:ui';

import 'package:logger/logger.dart';

enum M3DeviceType { tablet, mobile, desktop }

final class M3DeviceService {
  static M3DeviceType deviceType = M3DeviceType.mobile;

  static init() {
    var pixelRatio = window.devicePixelRatio;
    var physicalScreenSize = window.physicalSize;
    var shortestSide = physicalScreenSize.shortestSide / pixelRatio;
    final logger = Logger(
        printer:
            PrettyPrinter(methodCount: 0, colors: false, printEmojis: true));

    if (shortestSide < 600) {
      logger.d('Current Device is Mobile', '[ M3_core ]');
      return deviceType = M3DeviceType.mobile;
    }
    if (shortestSide < 900) {
      logger.d('Current Device is Tablet', '[ M3_core ]');

      return deviceType = M3DeviceType.tablet;
    }
    logger.d('Current Device is Desktop', '[ M3_core ]');

    return deviceType = M3DeviceType.desktop;
  }
}
