import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tokidoki_mobile/domain/entity/task.dart';
import 'package:tokidoki_mobile/ui/component/admob/bottom_ad_banner.dart';
import 'package:tokidoki_mobile/ui/component/common/base_drawer.dart';
import 'package:tokidoki_mobile/ui/component/dialog/delete_done_at_confirmation_dialog.dart';
import 'package:tokidoki_mobile/ui/component/dialog/delete_task_confirmation_dialog.dart';
import 'package:tokidoki_mobile/ui/component/simple_app_bar.dart';
import 'package:tokidoki_mobile/ui/style/customize_floating_location.dart';
import 'package:tokidoki_mobile/usecase/result.dart';
import 'package:tokidoki_mobile/usecase/state/task_list.dart';

// TODO: doneAt削除後にタスクが更新されていないので修正する
class EditTaskPage extends HookConsumerWidget {
  final Task task;

  const EditTaskPage({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController textEditingController =
        TextEditingController(text: task.name);

    final ValueNotifier<bool> isEditState = useState(false);

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
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  if (isEditState.value)
                    Column(
                      children: [
                        const Text('タスク名を変更'),
                        TextField(
                          controller: textEditingController,
                          decoration: const InputDecoration(
                            hintText: 'タスク名を入力してください',
                          ),
                        ),
                      ],
                    ),
                  const Text('実施履歴'),
                  Column(
                    children: watchedTask.dones
                        .map((done) => ListTile(
                              title: Text(done.doneDateAtString),
                              trailing: isEditState.value
                                  ? ElevatedButton(
                                      child: const Icon(Icons.delete),
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
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      child: const Text('タスクを削除',
                          style: TextStyle(color: Colors.white)),
                    ),
                ],
              ),
            ),
            BottomAdBanner(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          isEditState.value = !isEditState.value;
          if (isEditState.value) {
            return;
          }
          if (textEditingController.text == watchedTask.name) {
            Navigator.pop(context);
            return;
          }
          ref
              .read(taskListNotifierProvider.notifier)
              .updateTaskName(watchedTask, textEditingController.text)
              .then((result) {
            if (result == Result.success) {
              Navigator.pop(context);
            } else if (result == Result.failed) {
              isEditState.value = !isEditState.value;
            }
          });
        },
        child: Icon(
          isEditState.value ? Icons.check : Icons.edit,
        ),
      ),
      floatingActionButtonLocation: SimpleFloatingLocation(),
      endDrawer: const BaseDrawer(),
    );
  }
}
