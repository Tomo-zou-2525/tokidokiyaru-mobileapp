import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tokidoki_mobile/domain/task.dart';
import 'package:tokidoki_mobile/infrastructure/api/api.dart';

part 'task_list.g.dart';

@riverpod
class TaskListNotifier extends _$TaskListNotifier {
  final API _repository = API();

  @override
  Future<List<Task>> build() async {
    return await _repository.getTaskList();
  }

  Future<void> getTaskList() async {
    state = AsyncValue.data(await build());
  }

  Future<void> updateOrder(List<Task> taskList) async {
    List<Task> newTaskList = [];
    taskList.asMap().forEach((index, task) {
      newTaskList.add(task.copyWith(order: index + 1));
    });
    state = AsyncValue.data(newTaskList);
    await _repository.updateTaskList(newTaskList);
  }

  Future<void> addTask(String name) async {
    final task = <String, dynamic>{
      'name': name,
    };
    await _repository.addTask(task);
    await getTaskList();
  }
}
