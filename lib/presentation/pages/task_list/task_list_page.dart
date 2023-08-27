import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tokidoki_mobile/presentation/pages/task_list/task_list_model.dart';
import 'package:tokidoki_mobile/presentation/pages/add_task/add_task_page.dart';
import 'package:tokidoki_mobile/presentation/pages/edit_task/edit_task_page.dart';

class TaskListPage extends ConsumerWidget {
  const TaskListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('やったこと一覧'),
        ),
        body: Center(
            child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: taskList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      height: 80,
                      child: Container(
                        padding: const EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                        child: Row(
                          children: [
                            Text(
                                '${taskList[index].name}　${taskList[index].getDateString()}'),
                            const Spacer(),
                            IconButton(
                              icon: const Icon(Icons.punch_clock),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          EditTaskPage(id: taskList[index].id)),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                })),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddTaskPage()),
            );
          },
          child: const Icon(Icons.add),
        ));
  }
}
