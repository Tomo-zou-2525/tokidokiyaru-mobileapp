import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:tokidoki_mobile/domain/entity/task.dart';
import 'package:tokidoki_mobile/ui/component/delete_confirmation_dialog.dart';
import 'package:tokidoki_mobile/ui/component/simple_app_bar.dart';
import 'package:tokidoki_mobile/usecase/state/task_list.dart';

class EditTaskPage extends HookConsumerWidget {
  final Task task;

  const EditTaskPage({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController textEditingController =
        TextEditingController(text: task.name);

    // TODO: dbから取得したものに変換
    final nowStr = DateFormat('yyyy/MM/dd HH:mm').format(DateTime.now());
    List<String> doneAtList = [
      nowStr,
      nowStr,
      nowStr,
      nowStr,
      nowStr,
    ];

    return Scaffold(
      appBar: SimpleAppBar(title: 'タスク編集'),
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
              Column(
                children: doneAtList
                    .map((doneAt) => ListTile(
                          title: Text(doneAt),
                          trailing: ElevatedButton(
                              child: const Icon(Icons.delete),
                              onPressed: () {
                                // TODO: deleteDoneAtを実装
                              }),
                        ))
                    .toList(),
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return DeleteConfirmationDialog(task: task);
                    },
                  );
                },
                child: const Text('タスクを削除'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
