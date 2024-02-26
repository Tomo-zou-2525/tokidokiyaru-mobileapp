// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TaskForm {
  TaskNameInput get nameInput => throw _privateConstructorUsedError;
  bool get isValid => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TaskFormCopyWith<TaskForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskFormCopyWith<$Res> {
  factory $TaskFormCopyWith(TaskForm value, $Res Function(TaskForm) then) =
      _$TaskFormCopyWithImpl<$Res, TaskForm>;
  @useResult
  $Res call({TaskNameInput nameInput, bool isValid});
}

/// @nodoc
class _$TaskFormCopyWithImpl<$Res, $Val extends TaskForm>
    implements $TaskFormCopyWith<$Res> {
  _$TaskFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nameInput = null,
    Object? isValid = null,
  }) {
    return _then(_value.copyWith(
      nameInput: null == nameInput
          ? _value.nameInput
          : nameInput // ignore: cast_nullable_to_non_nullable
              as TaskNameInput,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TaskFormCopyWith<$Res> implements $TaskFormCopyWith<$Res> {
  factory _$$_TaskFormCopyWith(
          _$_TaskForm value, $Res Function(_$_TaskForm) then) =
      __$$_TaskFormCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TaskNameInput nameInput, bool isValid});
}

/// @nodoc
class __$$_TaskFormCopyWithImpl<$Res>
    extends _$TaskFormCopyWithImpl<$Res, _$_TaskForm>
    implements _$$_TaskFormCopyWith<$Res> {
  __$$_TaskFormCopyWithImpl(
      _$_TaskForm _value, $Res Function(_$_TaskForm) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nameInput = null,
    Object? isValid = null,
  }) {
    return _then(_$_TaskForm(
      nameInput: null == nameInput
          ? _value.nameInput
          : nameInput // ignore: cast_nullable_to_non_nullable
              as TaskNameInput,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_TaskForm implements _TaskForm {
  _$_TaskForm({required this.nameInput, required this.isValid});

  @override
  final TaskNameInput nameInput;
  @override
  final bool isValid;

  @override
  String toString() {
    return 'TaskForm(nameInput: $nameInput, isValid: $isValid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TaskForm &&
            (identical(other.nameInput, nameInput) ||
                other.nameInput == nameInput) &&
            (identical(other.isValid, isValid) || other.isValid == isValid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, nameInput, isValid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TaskFormCopyWith<_$_TaskForm> get copyWith =>
      __$$_TaskFormCopyWithImpl<_$_TaskForm>(this, _$identity);
}

abstract class _TaskForm implements TaskForm {
  factory _TaskForm(
      {required final TaskNameInput nameInput,
      required final bool isValid}) = _$_TaskForm;

  @override
  TaskNameInput get nameInput;
  @override
  bool get isValid;
  @override
  @JsonKey(ignore: true)
  _$$_TaskFormCopyWith<_$_TaskForm> get copyWith =>
      throw _privateConstructorUsedError;
}
