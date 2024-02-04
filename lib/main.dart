import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tokidoki_mobile/domain/repository/repository.dart';
import 'package:tokidoki_mobile/infrastructure/db/dao.dart';
import 'package:tokidoki_mobile/infrastructure/db/init.dart';
import 'package:tokidoki_mobile/ui/page/task_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final db = await open();
  runApp(
    ProviderScope(
        overrides: [repositoryProvider.overrideWithValue(DAO(db: db))],
        child: const App()),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'tokidoki',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xFFDBE1FF)),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2764EF)),
        useMaterial3: true,
      ),
      home: const TaskListPage(),
    );
  }
}
