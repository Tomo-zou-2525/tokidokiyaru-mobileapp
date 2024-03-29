import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tokidoki_mobile/domain/entity/task.dart';
import 'package:tokidoki_mobile/domain/valueObject/id.dart';
import 'package:tokidoki_mobile/infrastructure/db/dto/done.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
abstract class TaskDTO implements _$TaskDTO {
  const TaskDTO._();

  const factory TaskDTO({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'order_num') required int orderNum,
    @JsonKey(name: 'dones') List<DoneDTO>? dones,
  }) = _Task;

  factory TaskDTO.fromJson(Map<String, dynamic> json) =>
      _$TaskDTOFromJson(json);

  Task toEntity() {
    return Task(
        id: Id(value: id),
        name: name,
        orderNum: orderNum,
        dones: dones?.map((done) => done.toEntity()).toList() ?? []);
  }
}
