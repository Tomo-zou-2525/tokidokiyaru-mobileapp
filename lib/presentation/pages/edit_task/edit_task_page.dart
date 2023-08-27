import 'package:flutter/material.dart';

class EditTaskPage extends StatelessWidget {
  final int id;

  const EditTaskPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('タスク編集'),
      ),
      body: Center(child: Text('タスク $id')),
    );
  }
}
