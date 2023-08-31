import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tokidoki_mobile/provider/task_list.dart';
import 'package:tokidoki_mobile/presentation/page/add_task/add_task_page.dart';
import 'package:tokidoki_mobile/presentation/page/edit_task/edit_task_page.dart';

class TaskListPage extends ConsumerWidget {
  const TaskListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskListFuture = ref.watch(taskListNotifierProvider);
    final mainWidget = taskListFuture.when(
      loading: () => Container(
          alignment: Alignment.center,
          child: CircularProgressIndicator(
            color: Theme.of(context).colorScheme.primary,
          )),
      error: (e, s) => const Text('タスク一覧の取得に失敗しました。'),
      data: (taskList) => ReorderableListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: taskList.length,
        itemBuilder: (BuildContext context, int index) {
          final task = taskList[index];
          return Container(
            key: ValueKey(task.id),
            // padding: const EdgeInsets.all(8.0),
            height: 80,
            decoration: BoxDecoration(
              border:
                  Border.all(color: Theme.of(context).colorScheme.secondary),
              color: Theme.of(context).colorScheme.surface,
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(8.0),
              title: Text(
                '${task.name} ${task.getLastRunDate()}',
                style: const TextStyle(fontSize: 20),
              ),
              trailing: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditTaskPage(task: task),
                    ),
                  );
                },
                child: const Icon(Icons.punch_clock, size: 40),
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
          ref.read(taskListNotifierProvider.notifier).updateOrder(taskList);
        },
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('やったこと一覧'),
      ),
      body: Center(child: mainWidget),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddTaskPage()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
