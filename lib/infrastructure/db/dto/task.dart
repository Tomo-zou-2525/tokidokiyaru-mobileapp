import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tokidoki_mobile/domain/entity/task.dart';
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
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _Task;

  factory TaskDTO.fromJson(Map<String, dynamic> json) =>
      _$TaskDTOFromJson(json);

  factory TaskDTO.fromEntity({required Task entity}) => TaskDTO(
        id: entity.id,
        name: entity.name,
        orderNum: entity.orderNum,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

  Task convertToEntity() {
    return Task(
        id: id,
        name: name,
        orderNum: orderNum,
        dones: dones?.map((done) => done.convertToEntity()).toList() ?? []);
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
