import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tokidoki_mobile/domain/entity/task.dart';
import 'package:tokidoki_mobile/domain/repository/repository.dart';
import 'package:tokidoki_mobile/ui/page/task_list.dart';

import '../fake_api.dart';
import '../utility.dart';

void main() {
  testWidgets('タスク一覧が空の時にメッセージが表示されること', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(overrides: [
        repositoryProvider.overrideWithValue(FakeAPI(taskList: []))
      ], child: const MaterialApp(home: TaskListPage())),
    );

    await tester.pumpAndSettle();

    expect(find.text('タスクを追加して下さい。'), findsOneWidget);
  });

  testWidgets('タスク一覧が表示されること', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(overrides: [
        repositoryProvider.overrideWithValue(FakeAPI(taskList: [
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
        ]))
      ], child: const MaterialApp(home: TaskListPage())),
    );

    await tester.pumpAndSettle();

    expect(find.byType(ListTile), findsNWidgets(3));
    expect(findPartialText('タスク1'), findsOneWidget);
    expect(findPartialText('タスク2'), findsOneWidget);
    expect(findPartialText('タスク3'), findsOneWidget);
  });
}
