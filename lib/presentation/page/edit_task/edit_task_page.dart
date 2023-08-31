import 'package:flutter/material.dart';
import 'package:tokidoki_mobile/model/task.dart';

class EditTaskPage extends StatelessWidget {
  final Task task;

  const EditTaskPage({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('タスク編集'),
      ),
      body: Center(child: Text(task.name)),
    );
  }
}
