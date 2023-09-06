import 'package:freezed_annotation/freezed_annotation.dart';
part 'task.freezed.dart';
part 'task.g.dart';

@freezed
abstract class Task implements _$Task {
  const Task._();

  const factory Task({
    required int id,
    required String name,
    required int order,
    required List<DateTime> runAtList,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  String get lastRunDate =>
      '${runAtList.last.year}/${runAtList.last.month}/${runAtList.last.day}';
}
