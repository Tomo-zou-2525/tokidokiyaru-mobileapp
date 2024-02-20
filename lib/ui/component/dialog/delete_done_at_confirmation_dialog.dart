import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tokidoki_mobile/domain/entity/done.dart';
import 'package:tokidoki_mobile/usecase/state/task_list.dart';

class DeleteDoneAtConfirmationDialog extends ConsumerWidget {
  final Done done;

  const DeleteDoneAtConfirmationDialog({Key? key, required this.done})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: const Text('削除の確認'),
      content: const Text("この履歴を削除しますか？"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('キャンセル'),
        ),
        TextButton(
          onPressed: () {
            ref
                .read(taskListNotifierProvider.notifier)
                .deleteDoneAt(done)
                .then((_) => Navigator.pop(context));
          },
          child: const Text('削除'),
        ),
      ],
    );
  }
}
