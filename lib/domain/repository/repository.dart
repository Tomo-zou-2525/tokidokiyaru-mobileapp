import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tokidoki_mobile/domain/entity/done.dart';
import 'package:tokidoki_mobile/domain/entity/task.dart';

part 'repository.g.dart';

@riverpod
Repository repository(RepositoryRef ref) =>
    throw UnimplementedError('Provider was not initialized');

abstract interface class Repository {
  Future<List<Task>> getTaskList();

  Future<void> updateTaskListOrder(List<Task> taskList);

  Future<void> addTask(String name);

  Future<void> updateTaskName(Task task);

  Future<void> deleteTask(Task task);

  Future<void> addDone(Task task, DateTime doneAt);

  Future<void> deleteDone(Done done);
}
