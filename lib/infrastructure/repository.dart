import 'dart:convert';

// import 'package:http/http.dart' as http;
import 'package:tokidoki_mobile/domain/task.dart';

// TODO: エラーハンドリング

class Repository {
  // TODO: エンドポイントを直す（Flavorで分ける？）
  String baseEndpoint = 'localhost:8000';

  Future<List<Task>> getTaskList() async {
    // final response = await http.get(Uri.parse('$baseEndpoint/tasks'));
    // final jsonResponse =
    //     jsonDecode(response.body) as List<Map<String, dynamic>>;
    // return jsonResponse.map((data) => Task.fromJson(data)).toList();

    // TODO: APIを呼び出す代わりに、3秒待ってモックデータを返す
    const sec3 = Duration(seconds: 3);
    await Future.delayed(sec3);
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
    String jsonList = jsonEncode(taskList);
    // await http.put(Uri.parse('$baseEndpoint/tasks'), body: jsonList);
    // TODO: APIを呼び出す代わりに、1秒待つ
    print(jsonList);
    const sec3 = Duration(seconds: 1);
    await Future.delayed(sec3);
  }
}
