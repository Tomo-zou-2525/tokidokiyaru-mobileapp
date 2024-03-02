import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tokidoki_mobile/domain/errors/error.dart';
import 'package:tokidoki_mobile/main.dart';
import 'package:tokidoki_mobile/usecase/state/error.dart';

Future<void> showErrorSnackbar(WidgetRef ref, String message) {
  ScaffoldMessengerState scaffoldMessangerState = scaffoldKey.currentState!;
  final snackBar = SnackBar(
    backgroundColor: Colors.red,
    content: Text(message),
    duration: const Duration(seconds: 10),
    action: SnackBarAction(
      label: 'close',
      onPressed: () {
        scaffoldMessangerState.hideCurrentSnackBar();
      },
    ),
  );
  return scaffoldMessangerState.showSnackBar(snackBar).closed.then(
    (_) {
      ref.read(errorNotifierProvider.notifier).updateState(ErrorType.none);
    },
  );
}
