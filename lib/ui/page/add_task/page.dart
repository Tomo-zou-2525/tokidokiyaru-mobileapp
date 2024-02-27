import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tokidoki_mobile/ui/component/admob/bottom_ad_banner.dart';
import 'package:tokidoki_mobile/ui/component/common/base_drawer.dart';
import 'package:tokidoki_mobile/ui/component/form_error_message.dart';
import 'package:tokidoki_mobile/ui/component/simple_app_bar.dart';
import 'package:tokidoki_mobile/ui/page/add_task/validation/add_task_form_controller.dart';
import 'package:tokidoki_mobile/usecase/result.dart';
import 'package:tokidoki_mobile/usecase/state/task_list.dart';
// import 'package:tokidoki_mobile/ui/style/customize_floating_location.dart';

// TODO: 一覧にタスクを表示するために仮実装しただけ。後でデザインは整える。

class AddTaskPage extends ConsumerWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskForm = ref.watch(addTaskFormControllerProvider);

    return Scaffold(
      appBar: SimpleAppBar(title: 'タスク作成'),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(children: [
                TextField(
                  decoration: const InputDecoration(
                    hintText: 'タスク名を入力してください',
                  ),
                  onChanged: ref
                      .read(addTaskFormControllerProvider.notifier)
                      .onChangeTaskName,
                ),
                FormErrorMessage(
                    errorMessage:
                        taskForm.nameInput.displayError?.errorMessage),
                ElevatedButton(
                  onPressed: taskForm.isValid
                      ? () {
                          ref
                              .read(taskListNotifierProvider.notifier)
                              .addTask(taskForm.nameInput.value)
                              .then((result) {
                            if (result == Result.success) {
                              Navigator.pop(context);
                            }
                          });
                        }
                      : null,
                  child: const Text('作成'),
                ),
              ]),
            ),
            BottomAdBanner(),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(builder: (context) => const AddTaskPage()),
      //     );
      //   },
      //   child: const Icon(Icons.add),
      // ),
      // floatingActionButtonLocation: SimpleFloatingLocation(),
      endDrawer: const BaseDrawer(),
    );
  }
}
