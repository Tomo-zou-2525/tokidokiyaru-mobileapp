import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tokidoki_mobile/domain/entity/task.dart';
import 'package:tokidoki_mobile/domain/repository/repository.dart';

part 'task_list.g.dart';

@riverpod
class TaskListNotifier extends _$TaskListNotifier {
  @override
  Future<List<Task>> build() async {
    state = const AsyncValue.loading();
    final repository = ref.read(repositoryProvider);
    return await repository.getTaskList();
  }

  Future<void> getTaskList() async {
    state = AsyncValue.data(await build());
  }

  Future<void> updateOrder(List<Task> taskList) async {
    final repository = ref.read(repositoryProvider);
    List<Task> newTaskList = [];
    taskList.asMap().forEach((index, task) {
      newTaskList.add(task.copyWith(orderNum: index + 1));
    });
    state = AsyncValue.data(newTaskList);
    await repository.updateTaskList(newTaskList);
  }

  Future<void> addTask(String name) async {
    final repository = ref.read(repositoryProvider);
    await repository.addTask(name);
    await getTaskList();
  }

  Future<void> updateTask(Task task, String name) async {
    final repository = ref.read(repositoryProvider);
    final newTask = task.copyWith(name: name);
    await repository.updateTask(newTask);
    await getTaskList();
  }

  Future<void> deleteTask(Task task) async {
    final repository = ref.read(repositoryProvider);
    await repository.deleteTask(task.id);
    await getTaskList();
  }
}
