import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tokidoki_mobile/domain/entity/task.dart';
import 'package:tokidoki_mobile/ui/component/loader.dart';
import 'package:tokidoki_mobile/ui/page/add_task.dart';
import 'package:tokidoki_mobile/ui/page/edit_task.dart';
import 'package:tokidoki_mobile/usecase/state/task_list.dart';

class TaskListPage extends ConsumerWidget {
  const TaskListPage({Key? key}) : super(key: key);

  Widget createTaskList(List<Task> taskList, WidgetRef ref) {
    return ReorderableListView.builder(
      padding: const EdgeInsets.all(8),
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
                '${task.name} ${task.lastRunDate}',
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
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskListFuture = ref.watch(taskListNotifierProvider);
    final mainWidget = taskListFuture.when(
        loading: () => createProgressIndicator(context),
        error: (e, s) => const Text(
              'タスク一覧の取得に失敗しました。',
              style: TextStyle(fontSize: 20),
            ),
        data: (taskList) => taskList.isEmpty
            ? const Text(
                'タスクを追加して下さい。',
                style: TextStyle(fontSize: 20),
              )
            : createTaskList(taskList, ref));

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
