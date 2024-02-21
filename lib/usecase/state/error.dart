import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tokidoki_mobile/domain/errors/error.dart';

part 'error.g.dart';

@riverpod
class ErrorNotifier extends _$ErrorNotifier {
  @override
  ErrorType build() {
    return ErrorType.none;
  }

  // データを変更する関数
  void updateState(ErrorType error) {
    state = error;
  }
}
