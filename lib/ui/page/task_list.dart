import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tokidoki_mobile/ui/component/admob/bottom_ad_banner.dart';
import 'package:tokidoki_mobile/ui/component/common/base_drawer.dart';
import 'package:tokidoki_mobile/ui/component/loader.dart';
import 'package:tokidoki_mobile/ui/component/simple_app_bar.dart';
import 'package:tokidoki_mobile/ui/component/task_list_view.dart';
import 'package:tokidoki_mobile/ui/page/add_task/page.dart';
import 'package:tokidoki_mobile/ui/style/customize_floating_location.dart';
import 'package:tokidoki_mobile/usecase/state/app_lifecycle_state.dart';
import 'package:tokidoki_mobile/usecase/state/task_list.dart';

class TaskListPage extends ConsumerWidget {
  const TaskListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((_) => _showTutorial(context));

    final taskListFuture = ref.watch(taskListNotifierProvider);

    ref.listen<AppLifecycleState>(appLifecycleStateProvider, (previous, next) {
      if (next.isResumed) {
        ref.read(taskListNotifierProvider.notifier).updateState();
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
            : TaskListView(taskList));

    return Scaffold(
      appBar: SimpleAppBar(title: 'Tasks', automaticallyImplyLeading: false),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: Center(child: mainWidget)),
            BottomAdBanner(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddTaskPage()),
          );
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: SimpleFloatingLocation(),
      endDrawer: const BaseDrawer(),
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
