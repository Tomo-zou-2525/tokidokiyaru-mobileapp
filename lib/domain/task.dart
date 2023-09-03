import 'package:freezed_annotation/freezed_annotation.dart';
part 'task.freezed.dart';

@freezed
abstract class Task implements _$Task {
  const factory Task({
    required int id,
    required String name,
    required int order,
    required List<DateTime> runAtList,
  }) = _Task;

  const Task._();

  String get lastRunDate =>
      '${runAtList.last.year}/${runAtList.last.month}/${runAtList.last.day}';
}
