// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UpdateTask _$UpdateTaskFromJson(Map<String, dynamic> json) {
  return _UpdateTask.fromJson(json);
}

/// @nodoc
mixin _$UpdateTask {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get order => throw _privateConstructorUsedError;
  List<DateTime> get runAtList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateTaskCopyWith<UpdateTask> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateTaskCopyWith<$Res> {
  factory $UpdateTaskCopyWith(
          UpdateTask value, $Res Function(UpdateTask) then) =
      _$UpdateTaskCopyWithImpl<$Res, UpdateTask>;
  @useResult
  $Res call({int id, String name, int order, List<DateTime> runAtList});
}

/// @nodoc
class _$UpdateTaskCopyWithImpl<$Res, $Val extends UpdateTask>
    implements $UpdateTaskCopyWith<$Res> {
  _$UpdateTaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? order = null,
    Object? runAtList = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      runAtList: null == runAtList
          ? _value.runAtList
          : runAtList // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UpdateTaskCopyWith<$Res>
    implements $UpdateTaskCopyWith<$Res> {
  factory _$$_UpdateTaskCopyWith(
          _$_UpdateTask value, $Res Function(_$_UpdateTask) then) =
      __$$_UpdateTaskCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, int order, List<DateTime> runAtList});
}

/// @nodoc
class __$$_UpdateTaskCopyWithImpl<$Res>
    extends _$UpdateTaskCopyWithImpl<$Res, _$_UpdateTask>
    implements _$$_UpdateTaskCopyWith<$Res> {
  __$$_UpdateTaskCopyWithImpl(
      _$_UpdateTask _value, $Res Function(_$_UpdateTask) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? order = null,
    Object? runAtList = null,
  }) {
    return _then(_$_UpdateTask(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      runAtList: null == runAtList
          ? _value._runAtList
          : runAtList // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UpdateTask implements _UpdateTask {
  const _$_UpdateTask(
      {required this.id,
      required this.name,
      required this.order,
      required final List<DateTime> runAtList})
      : _runAtList = runAtList;

  factory _$_UpdateTask.fromJson(Map<String, dynamic> json) =>
      _$$_UpdateTaskFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final int order;
  final List<DateTime> _runAtList;
  @override
  List<DateTime> get runAtList {
    if (_runAtList is EqualUnmodifiableListView) return _runAtList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_runAtList);
  }

  @override
  String toString() {
    return 'UpdateTask(id: $id, name: $name, order: $order, runAtList: $runAtList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateTask &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.order, order) || other.order == order) &&
            const DeepCollectionEquality()
                .equals(other._runAtList, _runAtList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, order,
      const DeepCollectionEquality().hash(_runAtList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateTaskCopyWith<_$_UpdateTask> get copyWith =>
      __$$_UpdateTaskCopyWithImpl<_$_UpdateTask>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UpdateTaskToJson(
      this,
    );
  }
}

abstract class _UpdateTask implements UpdateTask {
  const factory _UpdateTask(
      {required final int id,
      required final String name,
      required final int order,
      required final List<DateTime> runAtList}) = _$_UpdateTask;

  factory _UpdateTask.fromJson(Map<String, dynamic> json) =
      _$_UpdateTask.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  int get order;
  @override
  List<DateTime> get runAtList;
  @override
  @JsonKey(ignore: true)
  _$$_UpdateTaskCopyWith<_$_UpdateTask> get copyWith =>
      throw _privateConstructorUsedError;
}
