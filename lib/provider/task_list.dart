import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tokidoki_mobile/model/task.dart';
part 'task_list.g.dart';

@riverpod
class TaskListNotifier extends _$TaskListNotifier {
  @override
  Future<List<Task>> build() async {
    // TODO: API呼び出しで取得したデータを返す代わりに、3秒待ってモックデータを返す
    const sec3 = Duration(seconds: 3);
    await Future.delayed(sec3);
    // mock data
    return [
      Task(
        id: 1,
        name: 'タスク1',
        order: 1,
        runAtList: [DateTime.parse('2023-03-20 10:05:30.000')],
      ),
      Task(
        id: 3,
        name: 'タスク2',
        order: 2,
        runAtList: [DateTime.parse('2023-05-01 01:04:11.000')],
      ),
      Task(
        id: 2,
        name: 'タスク3',
        order: 3,
        runAtList: [DateTime.parse('2023-04-29 18:53:55.000')],
      ),
    ];
  }

  void updateOrder(List<Task> taskList) async {
    taskList.asMap().forEach((index, task) {
      task.order = index + 1;
    });
    // TODO: APIを呼び出して更新する
    state = AsyncValue.data(taskList);
  }
}
