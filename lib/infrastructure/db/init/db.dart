import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tokidoki_mobile/infrastructure/db/init/migration.dart';

class DB {
  final _version = 1;

  Future<void> _onConfigure(Database db) async {
    await db.execute("PRAGMA foreign_keys = ON");
  }

  // 開発用。DBをリセットしたいときに使用する。
  Future<void> _deleteDB(String path) async {
    await deleteDatabase(path);
  }

  Future<Database> open() async {
    final path = join(await getDatabasesPath(), 'tokidokiyaru.db');
    // await _deleteDB(path);
    final db = await openDatabase(path,
        version: _version,
        onConfigure: _onConfigure, onCreate: (db, version) async {
      executeScript(db, 0, version);
    }, onUpgrade: (db, oldVersion, newVersion) async {
      executeScript(db, oldVersion, newVersion);
    });

    return db;
  }
}
