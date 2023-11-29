// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Task _$$_TaskFromJson(Map<String, dynamic> json) => _$_Task(
      id: json['id'] as int,
      name: json['name'] as String,
      orderNum: json['orderNum'] as int,
      dones: (json['dones'] as List<dynamic>)
          .map((e) => Done.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_TaskToJson(_$_Task instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'orderNum': instance.orderNum,
      'dones': instance.dones,
    };
