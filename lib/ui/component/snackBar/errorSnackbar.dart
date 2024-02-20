import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tokidoki_mobile/domain/errors/error.dart';
import 'package:tokidoki_mobile/usecase/state/error.dart';

Future<void> showErrorSnackbar(
    BuildContext context, WidgetRef ref, String message) {
  final snackBar = SnackBar(
    backgroundColor: Colors.red,
    content: Text(message),
    duration: const Duration(seconds: 10),
    action: SnackBarAction(
      label: 'close',
      onPressed: () {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      },
    ),
  );
  return ScaffoldMessenger.of(context).showSnackBar(snackBar).closed.then(
    (_) {
      ref.read(errorNotifierProvider.notifier).updateState(ErrorType.none);
    },
  );
}
