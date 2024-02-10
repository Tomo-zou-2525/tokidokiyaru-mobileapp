import 'dart:convert';

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

  factory TaskDTO.fromEntity({required Task entity}) => TaskDTO(
        id: entity.id.value,
        name: entity.name,
        orderNum: entity.orderNum,
      );

  Task toEntity() {
    return Task(
        id: Id(value: id),
        name: name,
        orderNum: orderNum,
        dones: dones?.map((done) => done.convertToEntity()).toList() ?? []);
  }

  String toInsertJSON() {
    final map = toJson();
    map.remove('id');
    map.remove('order_num');
    map.remove('dones');
    return jsonEncode(map);
  }

  Map<String, dynamic> toUpdateJSON() {
    final map = toJson();
    map.remove('id');
    map.remove('order_num');
    map.remove('dones');
    return map;
  }
}
