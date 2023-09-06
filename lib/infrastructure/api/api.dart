import 'dart:convert';

import 'package:tokidoki_mobile/domain/task.dart';
import 'package:tokidoki_mobile/infrastructure/api/client.dart';
import 'package:tokidoki_mobile/infrastructure/api/dto/add_task/add_task.dart';
// import 'package:tokidoki_mobile/infrastructure/api/dto/get_task/get_task.dart';
import 'package:tokidoki_mobile/infrastructure/api/dto/update_task/update_task.dart';

// TODO: エラーハンドリング
// TODO: Mockできない？ので、Providerで管理したい（方法がわからない）

class API {
  static final _singleton = API._internal();
  // TODO: エンドポイントを直す（Flavorで分ける？）
  static const String _baseEndpoint = 'localhost:8000';
  static final _client = CustomHttpClient();

  factory API() {
    return _singleton;
  }

  API._internal();

  Future<List<Task>> getTaskList() async {
    // final response = await _client.get('$_baseEndpoint/tasks');
    // final jsonResponse =
    //     jsonDecode(response.body) as List<Map<String, dynamic>>;
    // return jsonResponse
    //     .map((data) => GetTask.fromJson(data).toDomain())
    //     .toList();

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

  Future<void> updateTaskList(List<Task> taskList) async {
    String jsonList = jsonEncode(
        taskList.map((task) => UpdateTask.fromDomain(task)).toList());
    // await _client.put('$_baseEndpoint/tasks', body: jsonList);

    // TODO: APIを呼び出す代わりに、1秒待つ
    print(jsonList);
    const duration = Duration(seconds: 1);
    await Future.delayed(duration);
  }

  Future<void> addTask(String name) async {
    String json = jsonEncode(AddTask(name: name).toJson());
    // await _client.post('$_baseEndpoint/task', body: json);

    // TODO: APIを呼び出す代わりに、1秒待つ
    print(json);
    const duration = Duration(seconds: 1);
    await Future.delayed(duration);
  }
}
