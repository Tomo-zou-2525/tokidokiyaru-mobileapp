import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tokidoki_mobile/domain/entity/done.dart';
import 'package:tokidoki_mobile/domain/entity/task.dart';
import 'package:tokidoki_mobile/domain/valueObject/id.dart';

part 'done.freezed.dart';
part 'done.g.dart';

@freezed
abstract class DoneDTO implements _$DoneDTO {
  const DoneDTO._();

  const factory DoneDTO({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'task_id') required int taskId,
    @JsonKey(name: 'done_at') required DateTime doneAt,
  }) = _Done;

  factory DoneDTO.fromJson(Map<String, dynamic> json) =>
      _$DoneDTOFromJson(json);

  factory DoneDTO.fromEntity(Done done, Task task) => DoneDTO(
        id: done.id.value,
        taskId: task.id.value,
        doneAt: done.doneAt,
      );

  Done toEntity() {
    return Done(
      id: Id(value: id),
      doneAt: doneAt,
    );
  }

  Map<String, dynamic> toInsertJson() {
    final map = toJson();
    map.remove('id');
    map.remove('task_id');
    return map;
  }

  Map<String, dynamic> toUpdateMap() {
    final map = toJson();
    map.remove('id');
    map.remove('task_id');
    return map;
  }
}
