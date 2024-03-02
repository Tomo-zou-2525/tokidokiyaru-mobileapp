import 'package:flutter/material.dart';
import 'package:tokidoki_mobile/main.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackbar(
    String message) {
  ScaffoldMessengerState scaffoldMessangerState = scaffoldKey.currentState!;
  final snackBar = SnackBar(
    content: Text(message),
    action: SnackBarAction(
      label: 'close',
      onPressed: () => scaffoldMessangerState.hideCurrentSnackBar(),
    ),
  );
  return scaffoldMessangerState.showSnackBar(snackBar);
}
