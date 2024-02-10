import 'package:freezed_annotation/freezed_annotation.dart';

part 'id.freezed.dart';

@freezed
class Id with _$Id {
  const Id._();

  const factory Id({
    @Default(-1) int value,
  }) = _Id;

  bool get isTemporary => value == -1;
}
