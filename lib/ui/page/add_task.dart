import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tokidoki_mobile/usecase/state/task_list.dart';

// TODO: 一覧にタスクを表示するために仮実装しただけ。後でデザインは整える。

class AddTaskPage extends ConsumerWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String name = '';
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('タスク作成'),
        ),
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
                  ref.read(taskListNotifierProvider.notifier).addTask(name);
                },
                child: const Text('作成'),
              ),
            ],
          ),
        ));
  }
}
