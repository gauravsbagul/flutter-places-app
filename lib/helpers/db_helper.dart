import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqlite_api.dart';

class DBHelper {
  static Future<Database> database() async {
    final dbPath = await sql.getDatabasesPath();

    return await sql.openDatabase(path.join(dbPath, 'places.db'),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE user_places(id TEXT PRIMARY KEY, title TEXT, image TEXT,loc_lat REAL loc_lng REAL, addresss TEXT)');
    }, version: 1);
  }

  static Future<void> insert(Map<String, Object> data) async {
    final db = await DBHelper.database();

    db.insert(
      'user_places',
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getData() async {
    final db = await DBHelper.database();

    return db.query('user_places');
  }
}
