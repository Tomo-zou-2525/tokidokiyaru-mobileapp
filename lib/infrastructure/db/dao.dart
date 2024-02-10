import 'package:sqflite/sqflite.dart';
import 'package:tokidoki_mobile/domain/entity/task.dart';
import 'package:tokidoki_mobile/domain/repository/repository.dart';
import 'package:tokidoki_mobile/domain/valueObject/id.dart';
import 'package:tokidoki_mobile/infrastructure/db/dto/task.dart';

// TODO: エラーハンドリング
class DAO implements Repository {
  final Database db;

  DAO({required this.db});

  @override
  Future<List<Task>> getTaskList() async {
    List<Map<String, dynamic>> results = await db.rawQuery('''
    SELECT
      tasks.id, tasks.name, tasks.order_num, tasks.created_at, tasks.updated_at,
      dones.id as done_id, dones.done_at as dones_done_at, dones.created_at as dones_created_at, dones.updated_at as dones_updated_at
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
          'created_at': row['created_at'],
          'updated_at': row['updated_at'],
          'dones': [],
        };
      }

      if (row['done_id'] != null) {
        var doneMap = {
          'id': row['done_id'],
          'task_id': taskId,
          'done_at': row['done_at'],
          'created_at': row['created_at'],
          'updated_at': row['updated_at'],
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
  Future<void> addTask(Task task) async {
    final dto = TaskDTO.fromEntity(entity: task);
    await db.insert(
      "tasks",
      dto.toInsertMap(),
    );
  }

  @override
  Future<void> updateTask(Task task) async {
    final dto = TaskDTO.fromEntity(entity: task);

    await db.update(
      "tasks",
      dto.toUpdateMap(),
      where: "id = ?",
      whereArgs: [task.id],
    );
  }

  @override
  Future<void> deleteTask(Id id) async {
    await db.delete(
      "tasks",
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
