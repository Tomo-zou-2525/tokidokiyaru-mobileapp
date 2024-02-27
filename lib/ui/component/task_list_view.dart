import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tokidoki_mobile/domain/entity/task.dart';
import 'package:tokidoki_mobile/ui/component/snackBar/snackbar.dart';
import 'package:tokidoki_mobile/ui/page/edit_task/page.dart';
import 'package:tokidoki_mobile/usecase/state/task_list.dart';

class TaskListView extends ConsumerWidget {
  const TaskListView(this.taskList, {super.key});
  final List<Task> taskList;

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      ReorderableListView.builder(
        itemCount: taskList.length,
        itemBuilder: (BuildContext context, int index) {
          final task = taskList[index];
          return Padding(
            key: ValueKey(task.id),
            padding: const EdgeInsets.all(1.0),
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                border:
                    Border.all(color: Theme.of(context).colorScheme.secondary),
                color: Theme.of(context).colorScheme.surface,
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(8.0),
                title: Text(
                  // TODO: 実行したことがない場合の表記は別途考える。空文字でも良いかも。
                  '${task.name} ${task.lastDoneDate ?? '未実施'}',
                  style: const TextStyle(fontSize: 20),
                ),
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditTaskPage(task: task),
                    ),
                  )
                },
                trailing: ElevatedButton(
                  onPressed: () {
                    ref
                        .read(taskListNotifierProvider.notifier)
                        .recordDoneAt(task)
                        .then((_) => showSnackbar(context, 'やったぜ！！'));
                  },
                  child: const Icon(Icons.punch_clock, size: 40),
                ),
              ),
            ),
          );
        },
        onReorder: (int oldIndex, int newIndex) {
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          final task = taskList.removeAt(oldIndex);
          taskList.insert(newIndex, task);
          ref.read(taskListNotifierProvider.notifier).sortTaskList(taskList);
        },
      );
}
