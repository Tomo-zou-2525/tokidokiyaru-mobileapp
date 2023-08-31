class Task {
  int id;
  String name;
  int order;
  List<DateTime> runAtList;

  Task({
    required this.id,
    required this.name,
    required this.order,
    required this.runAtList,
  });

  getLastRunDate() {
    return '${runAtList.last.year}/${runAtList.last.month}/${runAtList.last.day}';
  }
}
