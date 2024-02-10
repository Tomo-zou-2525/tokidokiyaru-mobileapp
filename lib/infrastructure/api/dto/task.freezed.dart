// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TaskDTO _$TaskDTOFromJson(Map<String, dynamic> json) {
  return _Task.fromJson(json);
}

/// @nodoc
mixin _$TaskDTO {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_num')
  int get orderNum => throw _privateConstructorUsedError;
  @JsonKey(name: 'dones')
  List<DoneDTO>? get dones => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskDTOCopyWith<TaskDTO> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskDTOCopyWith<$Res> {
  factory $TaskDTOCopyWith(TaskDTO value, $Res Function(TaskDTO) then) =
      _$TaskDTOCopyWithImpl<$Res, TaskDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'order_num') int orderNum,
      @JsonKey(name: 'dones') List<DoneDTO>? dones});
}

/// @nodoc
class _$TaskDTOCopyWithImpl<$Res, $Val extends TaskDTO>
    implements $TaskDTOCopyWith<$Res> {
  _$TaskDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? orderNum = null,
    Object? dones = freezed,
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
      orderNum: null == orderNum
          ? _value.orderNum
          : orderNum // ignore: cast_nullable_to_non_nullable
              as int,
      dones: freezed == dones
          ? _value.dones
          : dones // ignore: cast_nullable_to_non_nullable
              as List<DoneDTO>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TaskCopyWith<$Res> implements $TaskDTOCopyWith<$Res> {
  factory _$$_TaskCopyWith(_$_Task value, $Res Function(_$_Task) then) =
      __$$_TaskCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'order_num') int orderNum,
      @JsonKey(name: 'dones') List<DoneDTO>? dones});
}

/// @nodoc
class __$$_TaskCopyWithImpl<$Res> extends _$TaskDTOCopyWithImpl<$Res, _$_Task>
    implements _$$_TaskCopyWith<$Res> {
  __$$_TaskCopyWithImpl(_$_Task _value, $Res Function(_$_Task) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? orderNum = null,
    Object? dones = freezed,
  }) {
    return _then(_$_Task(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      orderNum: null == orderNum
          ? _value.orderNum
          : orderNum // ignore: cast_nullable_to_non_nullable
              as int,
      dones: freezed == dones
          ? _value._dones
          : dones // ignore: cast_nullable_to_non_nullable
              as List<DoneDTO>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Task extends _Task {
  const _$_Task(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'order_num') required this.orderNum,
      @JsonKey(name: 'dones') final List<DoneDTO>? dones})
      : _dones = dones,
        super._();

  factory _$_Task.fromJson(Map<String, dynamic> json) => _$$_TaskFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'order_num')
  final int orderNum;
  final List<DoneDTO>? _dones;
  @override
  @JsonKey(name: 'dones')
  List<DoneDTO>? get dones {
    final value = _dones;
    if (value == null) return null;
    if (_dones is EqualUnmodifiableListView) return _dones;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'TaskDTO(id: $id, name: $name, orderNum: $orderNum, dones: $dones)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Task &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.orderNum, orderNum) ||
                other.orderNum == orderNum) &&
            const DeepCollectionEquality().equals(other._dones, _dones));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, orderNum,
      const DeepCollectionEquality().hash(_dones));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TaskCopyWith<_$_Task> get copyWith =>
      __$$_TaskCopyWithImpl<_$_Task>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TaskToJson(
      this,
    );
  }
}

abstract class _Task extends TaskDTO {
  const factory _Task(
      {@JsonKey(name: 'id') required final int id,
      @JsonKey(name: 'name') required final String name,
      @JsonKey(name: 'order_num') required final int orderNum,
      @JsonKey(name: 'dones') final List<DoneDTO>? dones}) = _$_Task;
  const _Task._() : super._();

  factory _Task.fromJson(Map<String, dynamic> json) = _$_Task.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'order_num')
  int get orderNum;
  @override
  @JsonKey(name: 'dones')
  List<DoneDTO>? get dones;
  @override
  @JsonKey(ignore: true)
  _$$_TaskCopyWith<_$_Task> get copyWith => throw _privateConstructorUsedError;
}
