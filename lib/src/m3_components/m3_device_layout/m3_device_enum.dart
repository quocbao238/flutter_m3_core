// ignore_for_file: deprecated_member_use

import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

enum M3DeviceType { tablet, mobile, desktop, another }

final class M3DeviceService {
  static M3DeviceType deviceType = M3DeviceType.mobile;

  static init() {
    final logger = Logger(
        printer:
            PrettyPrinter(methodCount: 0, colors: false, printEmojis: true));

    if (defaultTargetPlatform != TargetPlatform.android &&
        defaultTargetPlatform != TargetPlatform.iOS) {
      logger.d('Current Device is another', '[ M3_core ]');
      return deviceType = M3DeviceType.another;
    }

    var pixelRatio = window.devicePixelRatio;
    var physicalScreenSize = window.physicalSize;
    var shortestSide = physicalScreenSize.shortestSide / pixelRatio;

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

  static isMobile() => deviceType == M3DeviceType.mobile;

  static isTablet() => deviceType == M3DeviceType.tablet;

  static isDesktop() => deviceType == M3DeviceType.desktop;

  static isWeb() => deviceType == M3DeviceType.another;
}
