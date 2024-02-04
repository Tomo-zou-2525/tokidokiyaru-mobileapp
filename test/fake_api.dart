import 'package:tokidoki_mobile/domain/entity/task.dart';
import 'package:tokidoki_mobile/domain/repository/repository.dart';

class FakeAPI implements Repository {
  final List<Task> taskList;
  FakeAPI({this.taskList = const []});

  @override
  Future<List<Task>> getTaskList() async {
    Future.delayed(const Duration(seconds: 0));
    return taskList;
  }

  @override
  Future<void> updateTaskList(List<Task> taskList) async {
    await Future.delayed(const Duration(seconds: 0));
  }

  @override
  Future<void> addTask(String name) async {
    await Future.delayed(const Duration(seconds: 0));
  }

  // NOTE: apiを使うようになったら正式に実装する
  @override
  Future<void> updateTask(int id, String name) async {}

  @override
  Future<void> deleteTask(int id) async {}
}
