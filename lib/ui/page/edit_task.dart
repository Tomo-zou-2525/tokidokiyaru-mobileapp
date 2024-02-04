import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:tokidoki_mobile/domain/entity/task.dart';
import 'package:tokidoki_mobile/ui/component/simple_app_bar.dart';
import 'package:tokidoki_mobile/usecase/state/task_list.dart';

class EditTaskPage extends HookConsumerWidget {
  final Task task;

  const EditTaskPage({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController textEditingController =
        TextEditingController(text: task.name);

    final nowStr = DateFormat('yyyy/MM/dd HH:mm').format(DateTime.now());
    List<String> doneAtList = [
      nowStr,
      nowStr,
      nowStr,
      nowStr,
      nowStr,
    ];

    final ValueNotifier<bool> isEditState = useState(false);

    return Scaffold(
      appBar: SimpleAppBar(title: 'タスク編集'),
      body: Center(
        child: SizedBox(
          child: Column(
            children: [
              Column(
                children: [
                  isEditState.value
                      ? Column(children: [
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
                                  .updateTask(
                                      task.id, textEditingController.text);
                              Navigator.pop(context);
                            },
                            child: const Text('更新'),
                          ),
                        ])
                      : Text(task.name),
                ],
              ),
              Column(
                children: doneAtList
                    .asMap()
                    .entries
                    .map((entry) => ListTile(
                          title: Text(entry.value),
                          trailing: isEditState.value
                              ? ElevatedButton(
                                  child: const Icon(Icons.delete),
                                  onPressed: () {
                                    // TODO: deleteDoneAtを実装
                                  },
                                )
                              : null,
                        ))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          isEditState.value = !isEditState.value;
        },
        child: Icon(
          isEditState.value ? Icons.check : Icons.edit,
        ),
      ),
    );
  }
}
