import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tokidoki_mobile/domain/entity/task.dart';
import 'package:tokidoki_mobile/ui/component/snackBar/snackbar.dart';
import 'package:tokidoki_mobile/ui/page/edit_task.dart';
import 'package:tokidoki_mobile/ui/theme/app_text_style.dart';
import 'package:tokidoki_mobile/ui/theme/app_theme_color.dart';
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
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: AppThemeColor.blueBg.color,
                  width: 2,
                ),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                title: Text(
                  task.name,
                  style: task.name.length <= 12
                      ? AppTextStyle.largeBold.style
                      : AppTextStyle.middleBold.style,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(task.lastDoneDate ?? '-'),
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
