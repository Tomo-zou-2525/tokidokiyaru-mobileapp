import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tokidoki_mobile/domain/entity/task.dart';
import 'package:tokidoki_mobile/ui/component/admob/bottom_ad_banner.dart';
import 'package:tokidoki_mobile/ui/component/common/base_drawer.dart';
import 'package:tokidoki_mobile/ui/component/dialog/delete_done_at_confirmation_dialog.dart';
import 'package:tokidoki_mobile/ui/component/dialog/delete_task_confirmation_dialog.dart';
import 'package:tokidoki_mobile/ui/component/form_error_message.dart';
import 'package:tokidoki_mobile/ui/component/simple_app_bar.dart';
import 'package:tokidoki_mobile/ui/page/edit_task/form/edit_task_form_controller.dart';
import 'package:tokidoki_mobile/ui/style/customize_floating_location.dart';
import 'package:tokidoki_mobile/ui/theme/app_text_style.dart';
import 'package:tokidoki_mobile/ui/theme/app_theme_color.dart';
import 'package:tokidoki_mobile/usecase/result.dart';
import 'package:tokidoki_mobile/usecase/state/task_list.dart';

class EditTaskPage extends HookConsumerWidget {
  final Task task;

  const EditTaskPage({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskForm = ref.watch(editTaskFormControllerProvider(task));
    final ValueNotifier<bool> isEditState = useState(false);
    final editButtonEnabled = taskForm.isValid || !isEditState.value;

    /*
    FIXME:
    doneAtを削除した後に反映させるためにwatchしているが、少し乱暴かも。
    when使って、loading, error, data時の場合分けした方が安全だと思うが、
    appBarなどもtaskに依存しているので、これらもloadingで消えると見栄え悪いかもと思い、一旦この形にした。
    */
    final taskListFuture = ref.watch(taskListNotifierProvider);
    final watchedTask = taskListFuture.value?.firstWhere(
            (Task watchedTask) => watchedTask.id == task.id,
            orElse: () => task) ??
        task;

    return Scaffold(
      appBar: SimpleAppBar(title: watchedTask.name),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    if (isEditState.value)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Edit Task',
                            style: AppTextStyle.largeBold.style,
                          ),
                          const SizedBox(height: 4),
                          TextFormField(
                            initialValue:
                                editTaskFormControllerProvider(task).task.name,
                            decoration: const InputDecoration(
                              hintText: 'タスク名を入力してください',
                              border: OutlineInputBorder(),
                            ),
                            onChanged: ref
                                .read(editTaskFormControllerProvider(task)
                                    .notifier)
                                .onChangeTaskName,
                          ),
                          const SizedBox(height: 2),
                          FormErrorMessage(
                            errorMessage:
                                taskForm.nameInput.displayError?.errorMessage ??
                                    '',
                          ),
                        ],
                      ),
                    if (isEditState.value) const SizedBox(height: 32),
                    Text(
                      '実施履歴',
                      style: AppTextStyle.largeBold.style,
                    ),
                    Column(
                      children: watchedTask.dones
                          .map((done) => ListTile(
                                title: Text(
                                  done.doneDateAtString,
                                  style: AppTextStyle.middleBold.style,
                                ),
                                trailing: isEditState.value
                                    ? ElevatedButton(
                                        child: Icon(
                                          Icons.delete,
                                          color: AppThemeColor.pink.color,
                                        ),
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return DeleteDoneAtConfirmationDialog(
                                                  done: done);
                                            },
                                          );
                                        },
                                      )
                                    : null,
                              ))
                          .toList(),
                    ),
                    const SizedBox(height: 32),
                    if (isEditState.value)
                      ElevatedButton(
                        onPressed: () {
                          showDialog<bool>(
                            context: context,
                            builder: (BuildContext context) {
                              return DeleteTaskConfirmationDialog(
                                  task: watchedTask);
                            },
                          ).then((result) {
                            if (result == true) {
                              Navigator.pop(context);
                            }
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppThemeColor.pink.color,
                          fixedSize: const Size.fromWidth(200),
                        ),
                        child: Text(
                          'タスクを削除',
                          style: TextStyle(
                            color: AppThemeColor.black.color,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              BottomAdBanner(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: editButtonEnabled
              ? () {
                  isEditState.value = !isEditState.value;
                  if (isEditState.value) {
                    return;
                  }
                  if (taskForm.nameInput.value == watchedTask.name) {
                    Navigator.pop(context);
                    return;
                  }
                  ref
                      .read(taskListNotifierProvider.notifier)
                      .updateTaskName(watchedTask, taskForm.nameInput.value)
                      .then((result) {
                    if (result == Result.success) {
                      Navigator.pop(context);
                    } else if (result == Result.failed) {
                      isEditState.value = !isEditState.value;
                    }
                  });
                }
              : null,
          // TODO: 非活性のときのボタンの色。適当なので後で修正する。
          backgroundColor:
              editButtonEnabled ? null : AppThemeColor.graySub.color,
          child: Icon(
            isEditState.value ? Icons.check : Icons.edit,
          )),
      floatingActionButtonLocation: SimpleFloatingLocation(),
      endDrawer: const BaseDrawer(),
    );
  }
}
