import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tokidoki_mobile/infrastructure/db/init/migration.dart';

class DB {
  static const  _version = 1;

  static Future<void> _onConfigure(Database db) async {
    await db.execute("PRAGMA foreign_keys = ON");
  }

  // 開発用。DBをリセットしたいときに使用する。
  // ignore: unused_element
  static Future<void> _deleteDB(String path) async {
    await deleteDatabase(path);
  }

  static Future<Database> open() async {
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
