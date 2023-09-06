// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetTask _$GetTaskFromJson(Map<String, dynamic> json) {
  return _GetTask.fromJson(json);
}

/// @nodoc
mixin _$GetTask {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get order => throw _privateConstructorUsedError;
  List<DateTime> get runAtList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetTaskCopyWith<GetTask> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetTaskCopyWith<$Res> {
  factory $GetTaskCopyWith(GetTask value, $Res Function(GetTask) then) =
      _$GetTaskCopyWithImpl<$Res, GetTask>;
  @useResult
  $Res call({int id, String name, int order, List<DateTime> runAtList});
}

/// @nodoc
class _$GetTaskCopyWithImpl<$Res, $Val extends GetTask>
    implements $GetTaskCopyWith<$Res> {
  _$GetTaskCopyWithImpl(this._value, this._then);

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
abstract class _$$_GetTaskCopyWith<$Res> implements $GetTaskCopyWith<$Res> {
  factory _$$_GetTaskCopyWith(
          _$_GetTask value, $Res Function(_$_GetTask) then) =
      __$$_GetTaskCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, int order, List<DateTime> runAtList});
}

/// @nodoc
class __$$_GetTaskCopyWithImpl<$Res>
    extends _$GetTaskCopyWithImpl<$Res, _$_GetTask>
    implements _$$_GetTaskCopyWith<$Res> {
  __$$_GetTaskCopyWithImpl(_$_GetTask _value, $Res Function(_$_GetTask) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? order = null,
    Object? runAtList = null,
  }) {
    return _then(_$_GetTask(
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
class _$_GetTask extends _GetTask {
  const _$_GetTask(
      {required this.id,
      required this.name,
      required this.order,
      required final List<DateTime> runAtList})
      : _runAtList = runAtList,
        super._();

  factory _$_GetTask.fromJson(Map<String, dynamic> json) =>
      _$$_GetTaskFromJson(json);

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
    return 'GetTask(id: $id, name: $name, order: $order, runAtList: $runAtList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetTask &&
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
  _$$_GetTaskCopyWith<_$_GetTask> get copyWith =>
      __$$_GetTaskCopyWithImpl<_$_GetTask>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GetTaskToJson(
      this,
    );
  }
}

abstract class _GetTask extends GetTask {
  const factory _GetTask(
      {required final int id,
      required final String name,
      required final int order,
      required final List<DateTime> runAtList}) = _$_GetTask;
  const _GetTask._() : super._();

  factory _GetTask.fromJson(Map<String, dynamic> json) = _$_GetTask.fromJson;

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
  _$$_GetTaskCopyWith<_$_GetTask> get copyWith =>
      throw _privateConstructorUsedError;
}
