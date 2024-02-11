import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackbar(
    BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Text(message),
    action: SnackBarAction(
      label: 'close',
      onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
    ),
  );
  return ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
