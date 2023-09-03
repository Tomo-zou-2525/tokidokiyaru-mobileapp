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
      body: Center(
          child: Column(
        children: [
          Text('id: ${task.id.toString()}'),
          Text('name: ${task.name}'),
          Text('order: ${task.order.toString()}'),
          Text('lastRunDate: ${task.lastRunDate}'),
        ],
      )),
    );
  }
}
