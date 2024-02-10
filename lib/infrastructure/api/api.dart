import 'dart:convert';

import 'package:tokidoki_mobile/domain/entity/task.dart';
import 'package:tokidoki_mobile/domain/repository/repository.dart';
import 'package:tokidoki_mobile/domain/valueObject/id.dart';
import 'package:tokidoki_mobile/infrastructure/api/client.dart';
import 'package:tokidoki_mobile/infrastructure/api/dto/task.dart';

// TODO: エラーハンドリング
// TODO: エンドポイントを直す（Flavorで分ける？）
// NOTE: 全て仮実装。apiを使うようになったら正式に実装する
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
  Future<void> updateTaskList(List<Task> taskList) async {
// 実装する
  }

  @override
  Future<void> addTask(Task task) async {
    String json = jsonEncode(<String, dynamic>{
      'name': task.name,
    });
    await _client.post('$_baseEndpoint/tasks', body: json);
  }

  @override
  Future<void> updateTask(Task task) async {
    // 実装する
  }

  @override
  Future<void> deleteTask(Id id) async {
    // 実装する
  }
}
