import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tokidoki_mobile/domain/task.dart';

part 'get_task.freezed.dart';
part 'get_task.g.dart';

@freezed
abstract class GetTask implements _$GetTask {
  const GetTask._();

  const factory GetTask({
    required int id,
    required String name,
    required int order,
    required List<DateTime> runAtList,
  }) = _GetTask;

  factory GetTask.fromJson(Map<String, dynamic> json) => _$GetTaskFromJson(json);

  Task toDomain() {
    return Task(
      id: id,
      name: name,
      order: order,
      runAtList: runAtList
    );
  }
}
