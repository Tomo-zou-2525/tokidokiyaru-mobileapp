import 'dart:ui';

enum AppThemeColor {
  blueMain,
  snow,
  black,
  white,
  pink,
  grayBorder,
  graySub,
  grayBg,
  lightYellow,
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
      case AppThemeColor.pink:
        return const Color(0xFFFF7F7F);
      case AppThemeColor.grayBorder:
        return const Color(0xFF999999);
      case AppThemeColor.graySub:
        return const Color(0xFFCCCCCC);
      case AppThemeColor.grayBg:
        return const Color(0xFFF8F8F8);
      case AppThemeColor.lightYellow:
        return const Color(0xFFFFFBF0);
    }
  }
}
