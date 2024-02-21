import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tokidoki_mobile/domain/entity/done.dart';
import 'package:tokidoki_mobile/domain/entity/task.dart';
import 'package:tokidoki_mobile/domain/errors/error.dart';
import 'package:tokidoki_mobile/domain/repository/repository.dart';
import 'package:tokidoki_mobile/usecase/result.dart';
import 'package:tokidoki_mobile/usecase/state/error.dart';

part 'task_list.g.dart';

@riverpod
class TaskListNotifier extends _$TaskListNotifier {
  @override
  Future<List<Task>> build() async {
    state = const AsyncValue.loading();
    final repository = ref.read(repositoryProvider);
    return await repository.getTaskList();
  }

  _notifyError(ErrorType errorType) {
    ref.read(errorNotifierProvider.notifier).updateState(errorType);
  }

  Future<void> getTaskList() async {
    try {
      state = AsyncValue.data(await build());
    } on DomainException catch (e) {
      _notifyError(e.type);
    } catch (_) {
      _notifyError(ErrorType.unexpected);
    }
  }

  Future<Result> sortTaskList(List<Task> taskList) async {
    final repository = ref.read(repositoryProvider);
    List<Task> newTaskList = [];
    taskList.asMap().forEach((index, task) {
      newTaskList.add(task.copyWith(orderNum: index + 1));
    });
    state = AsyncValue.data(newTaskList);
    try {
      await repository.updateTaskOrder(newTaskList);
      return Result.success;
    } on DomainException catch (e) {
      _notifyError(e.type);
      return Result.failed;
    } catch (e) {
      _notifyError(ErrorType.unexpected);
      return Result.failed;
    }
  }

  Future<Result> addTask(String name) async {
    final repository = ref.read(repositoryProvider);
    try {
      await repository.addTask(name);
      await getTaskList();
      return Result.success;
    } on DomainException catch (e) {
      _notifyError(e.type);
      return Result.failed;
    } catch (e) {
      _notifyError(ErrorType.unexpected);
      return Result.failed;
    }
  }

  Future<Result> updateTaskName(Task task, String name) async {
    final repository = ref.read(repositoryProvider);
    final newTask = task.copyWith(name: name);
    try {
      await repository.updateTaskName(newTask);
      await getTaskList();
      return Result.success;
    } on DomainException catch (e) {
      _notifyError(e.type);
      return Result.failed;
    } catch (e) {
      _notifyError(ErrorType.unexpected);
      return Result.failed;
    }
  }

  Future<Result> deleteTask(Task task) async {
    final repository = ref.read(repositoryProvider);
    try {
      await repository.deleteTask(task);
      await getTaskList();
      return Result.success;
    } on DomainException catch (e) {
      _notifyError(e.type);
      return Result.failed;
    } catch (e) {
      _notifyError(ErrorType.unexpected);
      return Result.failed;
    }
  }

  Future<Result> recordDoneAt(Task task) async {
    final repository = ref.read(repositoryProvider);
    final doneAt = DateTime.now();
    try {
      await repository.addDone(task, doneAt);
      await getTaskList();
      return Result.success;
    } on DomainException catch (e) {
      _notifyError(e.type);
      return Result.failed;
    } catch (e) {
      _notifyError(ErrorType.unexpected);
      return Result.failed;
    }
  }

  Future<Result> deleteDoneAt(Done done) async {
    final repository = ref.read(repositoryProvider);
    try {
      await repository.deleteDone(done);
      await getTaskList();
      return Result.success;
    } on DomainException catch (e) {
      _notifyError(e.type);
      return Result.failed;
    } catch (e) {
      _notifyError(ErrorType.unexpected);
      return Result.failed;
    }
  }
}
