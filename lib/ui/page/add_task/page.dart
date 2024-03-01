import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tokidoki_mobile/ui/component/admob/bottom_ad_banner.dart';
import 'package:tokidoki_mobile/ui/component/common/base_drawer.dart';
import 'package:tokidoki_mobile/ui/component/form_error_message.dart';
import 'package:tokidoki_mobile/ui/component/simple_app_bar.dart';
import 'package:tokidoki_mobile/ui/page/add_task/form/add_task_form_controller.dart';
import 'package:tokidoki_mobile/ui/theme/app_text_style.dart';
import 'package:tokidoki_mobile/usecase/result.dart';
import 'package:tokidoki_mobile/usecase/state/task_list.dart';

class AddTaskPage extends ConsumerWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskForm = ref.watch(addTaskFormControllerProvider);

    return Scaffold(
      appBar: SimpleAppBar(title: 'Create Task'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Expanded(
                child: Column(children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Task',
                        style: AppTextStyle.largeBold.style,
                      ),
                      const SizedBox(height: 4),
                      TextField(
                        decoration: const InputDecoration(
                          hintText: 'タスク名を入力してください',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: ref
                            .read(addTaskFormControllerProvider.notifier)
                            .onChangeTaskName,
                      ),
                      const SizedBox(height: 2),
                      FormErrorMessage(
                        errorMessage:
                            taskForm.nameInput.displayError?.errorMessage ?? '',
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
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
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size.fromWidth(200),
                    ),
                    child: Text('作成', style: AppTextStyle.middleBold.style),
                  ),
                ]),
              ),
              BottomAdBanner(),
            ],
          ),
        ),
      ),
      endDrawer: const BaseDrawer(),
    );
  }
}
