import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tokidoki_mobile/domain/valueObject/id.dart';

part 'done.freezed.dart';

@freezed
abstract class Done implements _$Done {
  const Done._();

  const factory Done({
    required Id id,
    required DateTime doneAt,
  }) = _Done;

  String get doneDate => '${doneAt.year}/${doneAt.month}/${doneAt.day}';
}
