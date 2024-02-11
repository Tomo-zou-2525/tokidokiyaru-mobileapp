import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tokidoki_mobile/domain/entity/task.dart';
import 'package:tokidoki_mobile/domain/valueObject/id.dart';

part 'repository.g.dart';

@riverpod
Repository repository(RepositoryRef ref) =>
    throw UnimplementedError('Provider was not initialized');

abstract interface class Repository {
  Future<List<Task>> getTaskList();

  Future<void> updateTaskList(List<Task> taskList);

  Future<void> addTask(String name);

  Future<void> updateTask(Task task);

  Future<void> deleteTask(Id id);
}
