import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tokidoki_mobile/domain/entity/task.dart';
import 'package:tokidoki_mobile/ui/component/snackBar/snackbar.dart';
import 'package:tokidoki_mobile/ui/page/edit_task/page.dart';
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
          const double radius = 30;
          onIconTap(BuildContext context, Task task) {
            ref
                .read(taskListNotifierProvider.notifier)
                .recordDoneAt(task)
                .then((_) => showSnackbar(context, 'お疲れさまでした！次もがんばりましょう！'));
          }

          final task = taskList[index];
          return Container(
            key: ValueKey(task.id),
            height: 80,
            decoration: BoxDecoration(
              color: index % 2 == 0
                  ? AppThemeColor.white.color
                  : AppThemeColor.lightYellow.color,
              border: Border(
                bottom: BorderSide(
                    width: 1.5, color: AppThemeColor.grayBorder.color),
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
              subtitle: Text(task.latestDoneDateAt ?? '-'),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditTaskPage(task: task),
                  ),
                )
              },
              trailing: GestureDetector(
                onTap: () => onIconTap(context, task),
                child: GestureDetector(
                  onTap: () => onIconTap(context, task),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppThemeColor.snow.color,
                      borderRadius: BorderRadius.circular(radius),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(radius),
                      child: Image.asset(
                        'assets/images/feather_blue_skeleton.png',
                        width: radius * 2,
                        height: radius * 2,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
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
