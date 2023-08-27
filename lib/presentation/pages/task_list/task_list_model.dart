class Task {
  int id;
  String name;
  int order;
  DateTime dateTime;

  Task({
    required this.id,
    required this.name,
    required this.order,
    required this.dateTime,
  });

  getDateString() {
    return '${dateTime.year}/${dateTime.month}/${dateTime.day}';
  }
}

// mock data
List<Task> taskList = [
  Task(
    id: 1,
    name: 'タスク1',
    order: 1,
    dateTime: DateTime.parse('2023-03-20 10:05:30.000'),
  ),
  Task(
    id: 3,
    name: 'タスク2',
    order: 2,
    dateTime: DateTime.parse('2023-05-01 01:04:11.000'),
  ),
  Task(
    id: 2,
    name: 'タスク3',
    order: 3,
    dateTime: DateTime.parse('2023-04-29 18:53:55.000'),
  ),
];
