import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tokidoki_mobile/domain/errors/error.dart';
import 'package:tokidoki_mobile/usecase/state/error.dart';

class ErrorDialog extends ConsumerWidget {
  final String message;

  const ErrorDialog({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: const Text('エラーが発生しました'),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () {
            ref
                .read(errorNotifierProvider.notifier)
                .updateState(ErrorType.none);
            Navigator.pop(context);
          },
          child: const Text('閉じる'),
        ),
      ],
    );
  }
}
