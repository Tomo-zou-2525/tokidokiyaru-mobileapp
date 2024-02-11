import 'package:freezed_annotation/freezed_annotation.dart';

part 'id.freezed.dart';

@freezed
class Id with _$Id {
  const Id._();

  const factory Id({
    required int value,
  }) = _Id;
}
