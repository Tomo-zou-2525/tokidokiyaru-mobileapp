import 'package:formz/formz.dart';

const taskLengthLimit = 30;

enum TaskNameInputError {
  empty(errorMessage: '未入力です'),
  tooLonger(errorMessage: '$taskLengthLimit文字以下で入力してください'),
  ;

  const TaskNameInputError({required this.errorMessage});

  final String errorMessage;
}

class TaskNameInput extends FormzInput<String, TaskNameInputError> {
  const TaskNameInput.pure() : super.pure('');
  const TaskNameInput.dirty({String value = ''}) : super.dirty(value);

  @override
  TaskNameInputError? validator(String value) {
    if (value.isEmpty) return TaskNameInputError.empty;
    if (value.length >= 30) return TaskNameInputError.tooLonger;
    return null;
  }
}
