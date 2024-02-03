import 'package:sqflite/sqflite.dart';
import 'package:tokidoki_mobile/domain/entity/task.dart';
import 'package:tokidoki_mobile/domain/repository/repository.dart';
import 'package:tokidoki_mobile/infrastructure/db/dto/task.dart';

// TODO: エラーハンドリング
// TODO: トランザクション

class DAO implements Repository {
  final Database db;

  DAO({required this.db});

  @override
  Future<List<Task>> getTaskList() async {
    List<Map<String, dynamic>> results = await db.rawQuery('''
    SELECT tasks.*, dones.id as done_id, dones.done_at
    FROM tasks
    LEFT JOIN dones ON tasks.id = dones.task_id
    ORDER BY tasks.order_num ASC, dones.done_at ASC
''');

    Map<int, Map<String, dynamic>> tasksMap = {};
    for (var row in results) {
      final taskId = row['id'] as int;
      if (!tasksMap.containsKey(taskId)) {
        tasksMap[taskId] = {
          'id': taskId,
          'name': row['name'],
          'order_num': row['order_num'],
          'dones': [],
        };
      }

      if (row['done_id'] != null) {
        var doneMap = {
          'id': row['done_id'],
          'task_id': taskId,
          'done_at': row['done_at'],
        };
        tasksMap[taskId]?['dones'].add(doneMap);
      }
    }

    final taskDTOs =
        tasksMap.values.map((taskMap) => TaskDTO.fromJson(taskMap)).toList();
    return taskDTOs.map((e) => e.convertToEntity()).toList();
  }

  @override
  Future<void> updateTaskList(List<Task> taskList) async {
    // TODO: 実装する。とりあえず1秒待つ
    const duration = Duration(seconds: 1);
    await Future.delayed(duration);
  }

  @override
  Future<void> addTask(String name) async {
    // TODO: DTO作って、そのDTOにtoMapメソッドを作るのが良さげ。
    await db.insert(
      "tasks",
      {
        "name": name,
      },
    );
  }

  @override
  Future<void> updateTask(int id, String name) async {
    await db.update(
      "tasks",
      {
        "name": name,
      },
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
