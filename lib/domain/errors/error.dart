enum ErrorType {
  none(''),
  taskDuplicate('このタスクは既に作成されています。'),
  unexpected("システムエラーが発生しました。");

  const ErrorType(this.message);

  final String message;
}

class DomainException implements Exception {
  final ErrorType type;
  const DomainException(this.type);

  @override
  String toString() => type.message;
}
