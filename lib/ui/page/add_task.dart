import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tokidoki_mobile/ui/component/simple_app_bar.dart';
import 'package:tokidoki_mobile/ui/page/task_list.dart';
import 'package:tokidoki_mobile/usecase/state/task_list.dart';

// TODO: 一覧にタスクを表示するために仮実装しただけ。後でデザインは整える。

class AddTaskPage extends ConsumerWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String name = '';
    return Scaffold(
        appBar: SimpleAppBar(title: 'タスク作成'),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              TextField(
                  decoration: const InputDecoration(
                    hintText: 'タスク名を入力してください',
                  ),
                  onChanged: (text) {
                    name = text;
                  }),
              ElevatedButton(
                onPressed: () {
                  ref
                      .read(taskListNotifierProvider.notifier)
                      .addTask(name)
                      .then(
                        (_) => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TaskListPage(),
                            )),
                      );
                },
                child: const Text('作成'),
              ),
            ],
          ),
        ));
  }
}
