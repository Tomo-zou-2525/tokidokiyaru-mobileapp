import 'package:freezed_annotation/freezed_annotation.dart';

part 'done.freezed.dart';
part 'done.g.dart';

@freezed
abstract class Done implements _$Done {
  const Done._();

  const factory Done({
    required int id,
    required DateTime doneAt,
  }) = _Done;

  factory Done.fromJson(Map<String, dynamic> json) => _$DoneFromJson(json);

  String get doneDate => '${doneAt.year}/${doneAt.month}/${doneAt.day}';
}
