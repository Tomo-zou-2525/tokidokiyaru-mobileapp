// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'done.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Done _$$_DoneFromJson(Map<String, dynamic> json) => _$_Done(
      id: json['id'] as int,
      doneAt: DateTime.parse(json['doneAt'] as String),
    );

Map<String, dynamic> _$$_DoneToJson(_$_Done instance) => <String, dynamic>{
      'id': instance.id,
      'doneAt': instance.doneAt.toIso8601String(),
    };
