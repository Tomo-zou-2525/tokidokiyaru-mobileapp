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

  factory Done.init({required String name}) =>
      Done(id: const Id(), doneAt: DateTime.now());

  String get doneDate => '${doneAt.year}/${doneAt.month}/${doneAt.day}';
}
