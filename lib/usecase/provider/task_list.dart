import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tokidoki_mobile/domain/task.dart';
import 'package:tokidoki_mobile/infrastructure/repository.dart';

part 'task_list.g.dart';

@riverpod
class TaskListNotifier extends _$TaskListNotifier {
  final Repository _repository = Repository();

  @override
  Future<List<Task>> build() async {
    return await _repository.getTaskList();
  }

  void updateOrder(List<Task> taskList) async {
    List<Task> newTaskList = [];
    taskList.asMap().forEach((index, task) {
      newTaskList.add(task.copyWith(order: index + 1));
    });
    await _repository.updateTaskList(newTaskList);
    state = AsyncValue.data(newTaskList);
  }
}
