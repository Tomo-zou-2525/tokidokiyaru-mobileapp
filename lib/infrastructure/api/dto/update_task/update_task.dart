import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tokidoki_mobile/domain/task.dart';

part 'update_task.freezed.dart';
part 'update_task.g.dart';

@freezed
abstract class UpdateTask with _$UpdateTask {
  const factory UpdateTask({
    required int id,
    required String name,
    required int order,
    required List<DateTime> runAtList,
  }) = _UpdateTask;

  factory UpdateTask.fromJson(Map<String, dynamic> json) =>
      _$UpdateTaskFromJson(json);

  factory UpdateTask.fromDomain(Task task) => UpdateTask(
      id: task.id,
      name: task.name,
      order: task.order,
      runAtList: task.runAtList);
}
