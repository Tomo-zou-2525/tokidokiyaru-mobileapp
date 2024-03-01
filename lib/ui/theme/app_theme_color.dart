import 'dart:ui';

enum AppThemeColor {
  blueMain,
  snow,
  black,
  white,
  grayBorder,
  grayBg,
}

extension AppThemeColorExtension on AppThemeColor {
  Color get color {
    switch (this) {
      case AppThemeColor.blueMain:
        return const Color(0xFF38BDF2);
      case AppThemeColor.snow:
        return const Color(0xFFE1FDFC);
      case AppThemeColor.black:
        return const Color(0xFF212121);
      case AppThemeColor.white:
        return const Color(0xFFFFFFFF);
      case AppThemeColor.grayBorder:
        return const Color(0xFF999999);
      case AppThemeColor.grayBg:
        return const Color(0xFFF8F8F8);
    }
  }
}
