import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tokidoki_mobile/domain/entity/done.dart';

part 'done.freezed.dart';
part 'done.g.dart';

@freezed
abstract class DoneDTO implements _$DoneDTO {
  const DoneDTO._();

  const factory DoneDTO({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'task_id') required int taskId,
    @JsonKey(name: 'done_at') required DateTime doneAt,
  }) = _Done;

  factory DoneDTO.fromJson(Map<String, dynamic> json) =>
      _$DoneDTOFromJson(json);

  Done convertToEntity() {
    return Done(
      id: id,
      doneAt: doneAt,
    );
  }
}
