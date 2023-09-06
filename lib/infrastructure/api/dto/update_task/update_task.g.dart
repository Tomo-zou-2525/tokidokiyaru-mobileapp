// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UpdateTask _$$_UpdateTaskFromJson(Map<String, dynamic> json) =>
    _$_UpdateTask(
      id: json['id'] as int,
      name: json['name'] as String,
      order: json['order'] as int,
      runAtList: (json['runAtList'] as List<dynamic>)
          .map((e) => DateTime.parse(e as String))
          .toList(),
    );

Map<String, dynamic> _$$_UpdateTaskToJson(_$_UpdateTask instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'order': instance.order,
      'runAtList': instance.runAtList.map((e) => e.toIso8601String()).toList(),
    };
