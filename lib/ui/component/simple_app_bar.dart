import 'package:flutter/material.dart';

class SimpleAppBar extends AppBar {
  SimpleAppBar({
    super.key,
    required String title,
    bool automaticallyImplyLeading = true,
  }) : super(
          title: Text(title),
          automaticallyImplyLeading: automaticallyImplyLeading,
        );
}
