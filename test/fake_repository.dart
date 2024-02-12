import 'package:tokidoki_mobile/domain/entity/done.dart';
import 'package:tokidoki_mobile/domain/entity/task.dart';
import 'package:tokidoki_mobile/domain/repository/repository.dart';

class FakeRepository implements Repository {
  final List<Task> taskList;
  FakeRepository({this.taskList = const []});

  @override
  Future<List<Task>> getTaskList() async {
    Future.delayed(const Duration(seconds: 0));
    return taskList;
  }

  @override
  Future<void> updateTaskListOrder(List<Task> taskList) async {
    await Future.delayed(const Duration(seconds: 0));
  }

  @override
  Future<void> addTask(String name) async {
    await Future.delayed(const Duration(seconds: 0));
  }

  @override
  Future<void> updateTaskName(Task task) async {
    await Future.delayed(const Duration(seconds: 0));
  }

  @override
  Future<void> deleteTask(Task task) async {
    await Future.delayed(const Duration(seconds: 0));
  }

  @override
  Future<void> addDone(Task task, DateTime doneAt) async {
    await Future.delayed(const Duration(seconds: 0));
  }

  @override
  Future<void> deleteDone(Done done) async {
    await Future.delayed(const Duration(seconds: 0));
  }
}
