import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tokidoki_mobile/domain/entity/task.dart';
import 'package:tokidoki_mobile/usecase/state/task_list.dart';

class EditTaskPage extends HookConsumerWidget {
  final Task task;

  const EditTaskPage({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController textEditingController =
        TextEditingController(text: task.name);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('タスク編集'),
      ),
      body: Center(
        child: SizedBox(
          child: Column(
            children: [
              TextField(
                controller: textEditingController,
                decoration: const InputDecoration(
                  hintText: 'タスク名を入力してください',
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  ref
                      .read(taskListNotifierProvider.notifier)
                      .updateTask(task.id, textEditingController.text);
                  Navigator.pop(context);
                },
                child: const Text('更新'),
              ),
              ElevatedButton(
                onPressed: () {
                  ref
                      .read(taskListNotifierProvider.notifier)
                      .deleteTask(task.id);
                  Navigator.pop(context);
                },
                child: const Text('削除'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
