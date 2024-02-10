import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tokidoki_mobile/domain/entity/done.dart';
import 'package:tokidoki_mobile/domain/valueObject/id.dart';

part 'task.freezed.dart';

@freezed
abstract class Task implements _$Task {
  const Task._();

  const factory Task({
    required Id id,
    required String name,
    required int orderNum,
    required List<Done> dones,
  }) = _Task;

  factory Task.init({required String name}) => Task(
        id: const Id(),
        name: name,
        orderNum: 0,
        dones: [],
      );

  String? get lastDoneDate => dones.isEmpty ? null : dones.last.doneDate;
}
