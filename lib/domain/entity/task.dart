import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tokidoki_mobile/domain/entity/done.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
abstract class Task implements _$Task {
  const Task._();

  const factory Task({
    required int id,
    required String name,
    required int orderNum,
    required List<Done> dones,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  String get lastDoneDate => dones.last.doneDate;
}
