import 'package:formz/formz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tokidoki_mobile/ui/common_form/task_form.dart';
import 'package:tokidoki_mobile/ui/common_form/task_validation.dart';

part 'edit_task_form_controller.g.dart';

@riverpod
class EditTaskFormController extends _$EditTaskFormController {
  @override
  TaskForm build() {
    return TaskForm(
      nameInput: const TaskNameInput.pure(),
      isValid: false,
    );
  }

  void onChangeTaskName(String value) {
    final nameInput = TaskNameInput.dirty(value: value);
    state = state.copyWith(
        nameInput: nameInput,
        isValid: Formz.validate([
          nameInput,
        ]));
  }
}
