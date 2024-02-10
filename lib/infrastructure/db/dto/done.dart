import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tokidoki_mobile/domain/entity/done.dart';
import 'package:tokidoki_mobile/domain/entity/task.dart';

part 'done.freezed.dart';
part 'done.g.dart';

@freezed
abstract class DoneDTO implements _$DoneDTO {
  const DoneDTO._();

  const factory DoneDTO({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'task_id') required int taskId,
    @JsonKey(name: 'done_at') required DateTime doneAt,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _Done;

  factory DoneDTO.fromJson(Map<String, dynamic> json) =>
      _$DoneDTOFromJson(json);

  factory DoneDTO.fromEntity(Done done, Task task) => DoneDTO(
        id: done.id,
        taskId: task.id,
        doneAt: done.doneAt,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

  Done convertToEntity() {
    return Done(
      id: id,
      doneAt: doneAt,
    );
  }

  Map<String, dynamic> toInsertMap() {
    final map = toJson();
    map.remove('id');
    return map;
  }

  Map<String, dynamic> toUpdateMap() {
    final map = toJson();
    map.remove('created_at');
    return map;
  }
}
