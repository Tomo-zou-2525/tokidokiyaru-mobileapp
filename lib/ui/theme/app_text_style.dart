import 'package:flutter/material.dart';

enum AppTextStyle {
  tinyRegular,
  tinyBold,
  middleRegular,
  middleBold,
  largeBold,
  bigBold,
}

extension AppTextStyleExtension on AppTextStyle {
  TextStyle get style {
    switch (this) {
      case AppTextStyle.tinyRegular:
        return const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w400,
        );
      case AppTextStyle.tinyBold:
        return const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w700,
        );
      case AppTextStyle.middleRegular:
        return const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        );
      case AppTextStyle.middleBold:
        return const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
        );
      case AppTextStyle.largeBold:
        return const TextStyle(
          fontSize: 21,
          fontWeight: FontWeight.w700,
        );
      case AppTextStyle.bigBold:
        return const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
        );
    }
  }
}
