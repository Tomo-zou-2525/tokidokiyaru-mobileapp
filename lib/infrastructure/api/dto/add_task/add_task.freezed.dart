// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AddTask _$AddTaskFromJson(Map<String, dynamic> json) {
  return _AddTask.fromJson(json);
}

/// @nodoc
mixin _$AddTask {
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddTaskCopyWith<AddTask> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddTaskCopyWith<$Res> {
  factory $AddTaskCopyWith(AddTask value, $Res Function(AddTask) then) =
      _$AddTaskCopyWithImpl<$Res, AddTask>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class _$AddTaskCopyWithImpl<$Res, $Val extends AddTask>
    implements $AddTaskCopyWith<$Res> {
  _$AddTaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddTaskCopyWith<$Res> implements $AddTaskCopyWith<$Res> {
  factory _$$_AddTaskCopyWith(
          _$_AddTask value, $Res Function(_$_AddTask) then) =
      __$$_AddTaskCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$_AddTaskCopyWithImpl<$Res>
    extends _$AddTaskCopyWithImpl<$Res, _$_AddTask>
    implements _$$_AddTaskCopyWith<$Res> {
  __$$_AddTaskCopyWithImpl(_$_AddTask _value, $Res Function(_$_AddTask) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$_AddTask(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AddTask implements _AddTask {
  const _$_AddTask({required this.name});

  factory _$_AddTask.fromJson(Map<String, dynamic> json) =>
      _$$_AddTaskFromJson(json);

  @override
  final String name;

  @override
  String toString() {
    return 'AddTask(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddTask &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddTaskCopyWith<_$_AddTask> get copyWith =>
      __$$_AddTaskCopyWithImpl<_$_AddTask>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AddTaskToJson(
      this,
    );
  }
}

abstract class _AddTask implements AddTask {
  const factory _AddTask({required final String name}) = _$_AddTask;

  factory _AddTask.fromJson(Map<String, dynamic> json) = _$_AddTask.fromJson;

  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_AddTaskCopyWith<_$_AddTask> get copyWith =>
      throw _privateConstructorUsedError;
}
