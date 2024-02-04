import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tokidoki_mobile/domain/entity/task.dart';

part 'repository.g.dart';

@riverpod
Repository repository(RepositoryRef ref) =>
    throw UnimplementedError('Provider was not initialized');

abstract interface class Repository {
  Future<List<Task>> getTaskList();

  Future<void> updateTaskList(List<Task> taskList);

  Future<void> addTask(String name);

  Future<void> updateTask(int id, String name);

  Future<void> deleteTask(int id);
}
