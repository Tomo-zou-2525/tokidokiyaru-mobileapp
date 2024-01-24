// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'done.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Done _$$_DoneFromJson(Map<String, dynamic> json) => _$_Done(
      id: json['id'] as int,
      taskId: json['task_id'] as int,
      doneAt: DateTime.parse(json['done_at'] as String),
    );

Map<String, dynamic> _$$_DoneToJson(_$_Done instance) => <String, dynamic>{
      'id': instance.id,
      'task_id': instance.taskId,
      'done_at': instance.doneAt.toIso8601String(),
    };
