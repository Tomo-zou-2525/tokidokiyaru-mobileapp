import 'package:formz/formz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tokidoki_mobile/ui/page/add_task/validation/task_form.dart';
import 'package:tokidoki_mobile/ui/page/add_task/validation/task_validation.dart';

part 'task_form_controller.g.dart';

@riverpod
class TaskFormController extends _$TaskFormController {
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
