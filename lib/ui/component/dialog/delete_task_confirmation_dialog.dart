import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tokidoki_mobile/domain/entity/task.dart';
import 'package:tokidoki_mobile/usecase/state/task_list.dart';

class DeleteTaskConfirmationDialog extends ConsumerWidget {
  final Task task;

  const DeleteTaskConfirmationDialog({Key? key, required this.task})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: const Text('削除の確認'),
      content: const Text("このタスクを削除しますか？"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context, false);
          },
          child: const Text('キャンセル'),
        ),
        TextButton(
          onPressed: () {
            ref
                .read(taskListNotifierProvider.notifier)
                .deleteTask(task)
                .then((_) => Navigator.pop(context, true));
          },
          child: const Text('削除'),
        ),
      ],
    );
  }
}
