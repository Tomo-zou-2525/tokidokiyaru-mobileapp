import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tokidoki_mobile/domain/task.dart';

part 'add_task.freezed.dart';
part 'add_task.g.dart';

@freezed
abstract class AddTask with _$AddTask {
  const factory AddTask({required String name}) = _AddTask;

  factory AddTask.fromJson(Map<String, dynamic> json) => _$AddTaskFromJson(json);

  factory AddTask.fromDomain(Task task) => AddTask(name: task.name);
}
