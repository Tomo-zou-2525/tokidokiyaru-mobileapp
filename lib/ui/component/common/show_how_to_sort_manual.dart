import 'package:flutter/material.dart';

void showHowToSortManual(BuildContext context) async {
  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('タスクのソートについて'),
        content: const Text(manualText),
        actions: [
          ElevatedButton(
            child: const Text('閉じる'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      );
    },
  );
}

const String manualText = 'メイン画面では、タスクを手動でソートすることができます。\n\n'
    'タスクを長押しすると、タスクが浮き上がります。'
    'その状態でタスクを上下に動かすことで、タスクの順番を変更することができます。';
