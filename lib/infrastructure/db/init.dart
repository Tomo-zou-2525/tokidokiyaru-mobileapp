import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> open() async {
  final path = join(await getDatabasesPath(), 'tokidokiyaru.db');
  // TODO: DB綺麗にしたいときはコメントアウト外す。諸々整えたら消す。
  // await deleteDatabase(path);
  final db = await openDatabase(path, onCreate: (db, version) async {
    // TODO: とりあえず適当に作成。created_atとかupdated_atとか必要かも。
    await db.execute(
      '''
      CREATE TABLE tasks (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL DEFAULT '',
        order_num INTEGER NOT NULL DEFAULT 0
      );
      ''',
    );
    await db.execute(
      '''
      CREATE TABLE dones (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        task_id INTEGER NOT NULL,
        done_at TEXT NOT NULL DEFAULT (datetime('now')),
        FOREIGN KEY (task_id) REFERENCES tasks(id) ON DELETE CASCADE
      );
      ''',
    );
  }, version: 1);

  return db;
}
