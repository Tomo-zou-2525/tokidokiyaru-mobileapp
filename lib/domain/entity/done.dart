import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tokidoki_mobile/domain/valueObject/id.dart';
import 'package:tokidoki_mobile/util/date.dart';

part 'done.freezed.dart';

@freezed
abstract class Done implements _$Done {
  const Done._();

  const factory Done({
    required Id id,
    required DateTime doneAt,
  }) = _Done;

  String get doneDateString => formatFromDateTime(doneAt, DateFormatType.date);
  String get doneDateAtString =>
      formatFromDateTime(doneAt, DateFormatType.dateTime);
}
