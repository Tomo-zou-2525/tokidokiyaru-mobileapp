class RunDate {
  final int id;
  final int taskId;
  final DateTime dateTime;

  RunDate({
    required this.id,
    required this.taskId,
    required this.dateTime,
  });

  String getDateString() {
    return '${dateTime.year}/${dateTime.month}/${dateTime.day}';
  }
}
