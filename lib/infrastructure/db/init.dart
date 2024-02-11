import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// TODO: DBマイグレーションとかは別途検討。

Future<Database> open() async {
  final path = join(await getDatabasesPath(), 'tokidokiyaru.db');
  // TODO: DB綺麗にしたいときはコメントアウト外す。諸々整えたら消す。
  // await deleteDatabase(path);
  final db = await openDatabase(path, onCreate: (db, version) async {
    await db.execute(
      '''
      CREATE TABLE tasks (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL UNIQUE,
        order_num INTEGER NOT NULL DEFAULT 0,
        created_at TEXT NOT NULL DEFAULT (datetime('now', 'localtime')),
        updated_at TEXT NOT NULL DEFAULT (datetime('now', 'localtime'))
      );
      ''',
    );
    await db.execute(
      '''
      CREATE TABLE dones (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        task_id INTEGER NOT NULL,
        done_at TEXT NOT NULL DEFAULT (datetime('now', 'localtime')),
        created_at TEXT NOT NULL DEFAULT (datetime('now', 'localtime')),
        updated_at TEXT NOT NULL DEFAULT (datetime('now', 'localtime')),
        FOREIGN KEY (task_id) REFERENCES tasks(id) ON DELETE CASCADE
      );
      ''',
    );
  }, version: 1);

  return db;
}
