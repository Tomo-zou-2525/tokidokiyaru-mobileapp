import 'package:flutter/material.dart';
import 'package:tokidoki_mobile/ui/theme/app_text_style.dart';

class SimpleAppBar extends AppBar {
  SimpleAppBar({
    super.key,
    required String title,
    bool automaticallyImplyLeading = true,
  }) : super(
          title: Text(
            title,
            style: title.length <= 11
                ? AppTextStyle.bigBold.style
                : AppTextStyle.middleBold.style,
          ),
          automaticallyImplyLeading: automaticallyImplyLeading,
        );
}
