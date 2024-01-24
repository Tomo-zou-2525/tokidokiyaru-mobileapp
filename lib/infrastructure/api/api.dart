import 'dart:convert';

import 'package:tokidoki_mobile/domain/entity/task.dart';
import 'package:tokidoki_mobile/domain/repository/repository.dart';
import 'package:tokidoki_mobile/infrastructure/api/client.dart';

// TODO: エラーハンドリング
// TODO: ドメインと直接変換するのではなくて、DTOを経由した方が良い

class API implements Repository {
  // TODO: エンドポイントを直す（Flavorで分ける？）
  final String _baseEndpoint = 'http://localhost:8000';
  final _client = CustomHttpClient();

  @override
  Future<List<Task>> getTaskList() async {
    final response = await _client.get('$_baseEndpoint/tasks?user_id=1');
    final jsonTasks = (jsonDecode(response.body) as List)
        .map((item) => item as Map<String, dynamic>)
        .toList();
    return jsonTasks.map((json) => Task.fromJson(json)).toList();
  }

  @override
  Future<void> updateTaskList(List<Task> taskList) async {
    // String jsonTasks = jsonEncode(taskList);
    // await _client.put('$_baseEndpoint/tasks', body: jsonTasks);

    // TODO: APIを呼び出す代わりに、1秒待つ
    const duration = Duration(seconds: 1);
    await Future.delayed(duration);
  }

  @override
  Future<void> addTask(String name) async {
    // String json = jsonEncode(<String, dynamic>{
    //   'name': name,
    // });
    // await _client.post('$_baseEndpoint/tasks', body: json);

    // TODO: APIを呼び出す代わりに、1秒待つ
    const duration = Duration(seconds: 1);
    await Future.delayed(duration);
  }
}
