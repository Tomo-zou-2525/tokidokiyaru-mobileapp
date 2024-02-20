import 'package:sqflite/sqflite.dart';

const migrationScripts = {
  1: [
    '''
      CREATE TABLE tasks (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL UNIQUE,
        order_num INTEGER NOT NULL DEFAULT 0,
        created_at TEXT NOT NULL DEFAULT (datetime('now', 'localtime')),
        updated_at TEXT NOT NULL DEFAULT (datetime('now', 'localtime'))
      );
      ''',
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
  ],
};

void executeScript(Database db, int oldVersion, int newVersion) async {
  for (int i = oldVersion + 1; i <= newVersion; i++) {
    List<String>? queries = migrationScripts[i];
    if (queries != null) {
      for (String query in queries) {
        await db.execute(query);
      }
    }
  }
}
