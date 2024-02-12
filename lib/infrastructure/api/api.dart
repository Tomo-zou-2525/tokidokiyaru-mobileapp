import 'dart:convert';

import 'package:tokidoki_mobile/domain/entity/done.dart';
import 'package:tokidoki_mobile/domain/entity/task.dart';
import 'package:tokidoki_mobile/domain/repository/repository.dart';
import 'package:tokidoki_mobile/infrastructure/api/client.dart';
import 'package:tokidoki_mobile/infrastructure/api/dto/task.dart';

/*
TODO:
- 全て仮実装。apiを使うようになったら正式に実装する
- エラーハンドリング
- エンドポイントを直す（Flavorで分ける？）
*/
class API implements Repository {
  final String _baseEndpoint = 'http://localhost:8000';
  final _client = CustomHttpClient();

  @override
  Future<List<Task>> getTaskList() async {
    final response = await _client.get('$_baseEndpoint/tasks?user_id=1');
    final jsonTasks = (jsonDecode(response.body) as List)
        .map((item) => item as Map<String, dynamic>)
        .toList();
    return jsonTasks.map((json) => TaskDTO.fromJson(json).toEntity()).toList();
  }

  @override
  Future<void> updateTaskListOrder(List<Task> taskList) async {
    // 実装する
  }

  @override
  Future<void> addTask(String name) async {
    String json = jsonEncode(<String, dynamic>{
      'name': name,
    });
    await _client.post('$_baseEndpoint/tasks', body: json);
  }

  @override
  Future<void> updateTaskName(Task task) async {
    // 実装する
  }

  @override
  Future<void> deleteTask(Task task) async {
    // 実装する
  }

  @override
  Future<void> addDone(Task task, DateTime doneAt) async {
    // 実装する
  }

  @override
  Future<void> deleteDone(Done done) async {
    // 実装する
  }
}
