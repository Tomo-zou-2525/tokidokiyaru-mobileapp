import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tokidoki_mobile/ui/common_validation/task_validation.dart';

part 'task_form.freezed.dart';

@freezed
class TaskForm with _$TaskForm {
  factory TaskForm({
    required TaskNameInput nameInput,
    required bool isValid,
  }) = _TaskForm;
}
