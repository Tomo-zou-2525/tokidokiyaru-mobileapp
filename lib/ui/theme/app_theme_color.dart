import 'dart:ui';

enum AppThemeColor {
  black,
  white,
  blueMain,
  blueBg,
  greenMain,
}

extension AppThemeColorExtension on AppThemeColor {
  Color get color {
    switch (this) {
      case AppThemeColor.black:
        return const Color(0xFF000000);
      case AppThemeColor.white:
        return const Color(0xFFFFFFFF);
      case AppThemeColor.blueMain:
        return const Color(0xFF2764EF);
      case AppThemeColor.blueBg:
        return const Color(0xFF45D1FD);
      case AppThemeColor.greenMain:
        return const Color(0xFF37AD1B);
    }
  }
}
