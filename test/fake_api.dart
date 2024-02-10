import 'package:tokidoki_mobile/domain/entity/task.dart';
import 'package:tokidoki_mobile/domain/repository/repository.dart';
import 'package:tokidoki_mobile/domain/valueObject/id.dart';

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
  Future<void> addTask(Task task) async {
    await Future.delayed(const Duration(seconds: 0));
  }

  // NOTE: apiを使うようになったら正式に実装する
  @override
  Future<void> updateTask(Task task) async {}

  @override
  Future<void> deleteTask(Id id) async {}
}
