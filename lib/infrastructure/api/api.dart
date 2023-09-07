// import 'dart:convert';

import 'package:tokidoki_mobile/domain/entity/task.dart';
import 'package:tokidoki_mobile/domain/repository/repository.dart';
// import 'package:tokidoki_mobile/infrastructure/api/client.dart';

// TODO: エラーハンドリング

class API implements Repository{
  // TODO: エンドポイントを直す（Flavorで分ける？）
  // final String _baseEndpoint = 'localhost:8000';
  // final _client = CustomHttpClient();

  @override
  Future<List<Task>> getTaskList() async {
    // final response = await _client.get('$_baseEndpoint/tasks');
    // final jsonTasks = jsonDecode(response.body) as List<Map<String, dynamic>>;
    // return jsonTasks.map((json) => Task.fromJson(json)).toList();

    // TODO: APIを呼び出す代わりに、3秒待ってモックデータを返す
    const duration = Duration(seconds: 3);
    await Future.delayed(duration);
    return [
      Task(
        id: 1,
        name: 'タスク1',
        order: 1,
        runAtList: [DateTime.parse('2023-03-20 10:05:30.000')],
      ),
      Task(
        id: 3,
        name: 'タスク2',
        order: 2,
        runAtList: [DateTime.parse('2023-05-01 01:04:11.000')],
      ),
      Task(
        id: 2,
        name: 'タスク3',
        order: 3,
        runAtList: [DateTime.parse('2023-04-29 18:53:55.000')],
      ),
    ];
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
