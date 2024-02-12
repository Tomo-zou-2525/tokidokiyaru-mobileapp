import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tokidoki_mobile/domain/entity/task.dart';
import 'package:tokidoki_mobile/ui/component/loader.dart';
import 'package:tokidoki_mobile/ui/component/simple_app_bar.dart';
import 'package:tokidoki_mobile/ui/component/snackbar.dart';
import 'package:tokidoki_mobile/ui/page/add_task.dart';
import 'package:tokidoki_mobile/ui/page/edit_task.dart';
import 'package:tokidoki_mobile/usecase/state/app_lifecycle_state.dart';
import 'package:tokidoki_mobile/usecase/state/task_list.dart';

class TaskListPage extends ConsumerWidget {
  const TaskListPage({Key? key}) : super(key: key);

  Widget createTaskListWidget(List<Task> taskList, WidgetRef ref) {
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
        ref.read(taskListNotifierProvider.notifier).updateOrder(taskList);
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((_) => _showTutorial(context));

    final taskListFuture = ref.watch(taskListNotifierProvider);

    ref.listen<AppLifecycleState>(appLifecycleStateProvider, (previous, next) {
      if (next.isResumed) {
        ref.read(taskListNotifierProvider.notifier).getTaskList();
      }
    });

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
            : createTaskListWidget(taskList, ref));

    return Scaffold(
      appBar: SimpleAppBar(title: 'やったこと一覧'),
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
      endDrawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text("このアプリについて"),
              onTap: () {
                Navigator.pushNamed(context, '/tutorial');
              },
            ),
            ListTile(
              title: const Text("利用規約"),
              onTap: () {
                Navigator.pushNamed(context, '/terms_of_service');
              },
            ),
            ListTile(
              title: const Text("プライバシーポリシー"),
              onTap: () {
                Navigator.pushNamed(context, '/privacy_policy');
              },
            ),
          ],
        ),
      ),
    );
  }
}

void _showTutorial(BuildContext context) {
  SharedPreferences.getInstance().then((prefs) {
    if (prefs.getBool('isFirst') != true) {
      Navigator.pushNamed(context, '/tutorial');
    }
  });
}
