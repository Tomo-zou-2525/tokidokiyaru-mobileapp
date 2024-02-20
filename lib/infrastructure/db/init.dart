import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tokidoki_mobile/infrastructure/db/migration.dart';

Future<void> _onConfigure(Database db) async {
  await db.execute("PRAGMA foreign_keys = ON");
}

Future<void> _deleteDB(String path) async {
  await deleteDatabase(path);
}

Future<Database> open() async {
  final path = join(await getDatabasesPath(), 'tokidokiyaru.db');
  final db = await openDatabase(path, version: 1, onConfigure: _onConfigure,
      onCreate: (db, version) async {
    executeScript(db, 0, version);
  }, onUpgrade: (db, oldVersion, newVersion) async {
    executeScript(db, oldVersion, newVersion);
  }, onDowngrade: onDatabaseDowngradeDelete);

  final tasks = await db.query("tasks");
  print(tasks);
  final dones = await db.query("dones");
  print(dones);

  return db;
}
