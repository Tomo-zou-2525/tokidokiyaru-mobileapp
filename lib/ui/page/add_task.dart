import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tokidoki_mobile/ui/component/admob/bottom_ad_banner.dart';
import 'package:tokidoki_mobile/ui/component/common/base_drawer.dart';
import 'package:tokidoki_mobile/ui/component/simple_app_bar.dart';
import 'package:tokidoki_mobile/usecase/result.dart';
import 'package:tokidoki_mobile/usecase/state/task_list.dart';
// import 'package:tokidoki_mobile/ui/style/customize_floating_location.dart';

// TODO: 一覧にタスクを表示するために仮実装しただけ。後でデザインは整える。

class AddTaskPage extends ConsumerWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String name = '';
    return Scaffold(
      appBar: SimpleAppBar(title: 'Create Task'),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(children: [
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
                        .then((result) {
                      if (result == Result.success) {
                        Navigator.pop(context);
                      }
                    });
                  },
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
