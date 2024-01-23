// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'done.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Done _$DoneFromJson(Map<String, dynamic> json) {
  return _Done.fromJson(json);
}

/// @nodoc
mixin _$Done {
  int get id => throw _privateConstructorUsedError;
  DateTime get doneAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DoneCopyWith<Done> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoneCopyWith<$Res> {
  factory $DoneCopyWith(Done value, $Res Function(Done) then) =
      _$DoneCopyWithImpl<$Res, Done>;
  @useResult
  $Res call({int id, DateTime doneAt});
}

/// @nodoc
class _$DoneCopyWithImpl<$Res, $Val extends Done>
    implements $DoneCopyWith<$Res> {
  _$DoneCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? doneAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      doneAt: null == doneAt
          ? _value.doneAt
          : doneAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DoneCopyWith<$Res> implements $DoneCopyWith<$Res> {
  factory _$$_DoneCopyWith(_$_Done value, $Res Function(_$_Done) then) =
      __$$_DoneCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, DateTime doneAt});
}

/// @nodoc
class __$$_DoneCopyWithImpl<$Res> extends _$DoneCopyWithImpl<$Res, _$_Done>
    implements _$$_DoneCopyWith<$Res> {
  __$$_DoneCopyWithImpl(_$_Done _value, $Res Function(_$_Done) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? doneAt = null,
  }) {
    return _then(_$_Done(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      doneAt: null == doneAt
          ? _value.doneAt
          : doneAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Done extends _Done {
  const _$_Done({required this.id, required this.doneAt}) : super._();

  factory _$_Done.fromJson(Map<String, dynamic> json) => _$$_DoneFromJson(json);

  @override
  final int id;
  @override
  final DateTime doneAt;

  @override
  String toString() {
    return 'Done(id: $id, doneAt: $doneAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Done &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.doneAt, doneAt) || other.doneAt == doneAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, doneAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DoneCopyWith<_$_Done> get copyWith =>
      __$$_DoneCopyWithImpl<_$_Done>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DoneToJson(
      this,
    );
  }
}

abstract class _Done extends Done {
  const factory _Done({required final int id, required final DateTime doneAt}) =
      _$_Done;
  const _Done._() : super._();

  factory _Done.fromJson(Map<String, dynamic> json) = _$_Done.fromJson;

  @override
  int get id;
  @override
  DateTime get doneAt;
  @override
  @JsonKey(ignore: true)
  _$$_DoneCopyWith<_$_Done> get copyWith => throw _privateConstructorUsedError;
}
