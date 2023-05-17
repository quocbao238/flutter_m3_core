import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';

enum M3ViewType { tablet, mobile, desktop }

final class M3ViewService {
  static final Logger _logger = Logger(
      printer: PrettyPrinter(methodCount: 0, colors: false, printEmojis: true));
  static M3ViewType m3ViewType = M3ViewType.mobile;

  static _checkViewType(double shortestSide) {
    if (shortestSide < 600) {
      if (m3ViewType != M3ViewType.mobile) {
        _logger.d('Layout size Mobile', '[ M3_core ]');
      }
      return M3ViewType.mobile;
    }
    if (shortestSide < 900) {
      if (m3ViewType != M3ViewType.tablet) {
        _logger.d('Layout size Tablet', '[ M3_core ]');
      }
      return M3ViewType.tablet;
    }
    if (m3ViewType != M3ViewType.desktop) {
      _logger.d('Layout size Desktop', '[ M3_core ]');
    }
    return M3ViewType.desktop;
  }

  static getViewType(BuildContext context) =>
      m3ViewType = _checkViewType(MediaQuery.of(context).size.shortestSide);

  static isMobile() => m3ViewType == M3ViewType.mobile;

  static isTablet() => m3ViewType == M3ViewType.tablet;

  static isDesktop() => m3ViewType == M3ViewType.desktop;
}
