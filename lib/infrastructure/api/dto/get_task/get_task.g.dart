// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GetTask _$$_GetTaskFromJson(Map<String, dynamic> json) => _$_GetTask(
      id: json['id'] as int,
      name: json['name'] as String,
      order: json['order'] as int,
      runAtList: (json['runAtList'] as List<dynamic>)
          .map((e) => DateTime.parse(e as String))
          .toList(),
    );

Map<String, dynamic> _$$_GetTaskToJson(_$_GetTask instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'order': instance.order,
      'runAtList': instance.runAtList.map((e) => e.toIso8601String()).toList(),
    };
