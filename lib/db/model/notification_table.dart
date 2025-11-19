import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class NotificationTable {
  Database? _db;
  

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final dataPath = await getDatabasesPath();
    final path = join(dataPath, 'notifications.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE notifications (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            type TEXT NOT NULL,
            meal_id TEXT NOT NULL,
            meal_name TEXT NOT NULL,
            is_read INTEGER NOT NULL DEFAULT 0,
            created_at TEXT NOT NULL
          );
        ''');
      },
    );
  }

  Future<int> insertNotification(Map<String, dynamic> notification) async {
    final db = await database;
    return await db.insert('notifications', notification);
  }

  Future<List<Map<String, dynamic>>> getAllNotifications() async {
    final db = await database;
    return await db.query('notifications', orderBy: "created_at DESC");
  }

  Future<List<Map<String, dynamic>>> getUnread() async {
    final db = await database;
    return await db.query('notifications', where: 'is_read = 0');
  }

  Future<List<Map<String, dynamic>>> getRead() async {
    final db = await database;
    return await db.query('notifications', where: 'is_read = 1');
  }

  Future<int> markAsRead(int id) async {
    final db = await database;
    return await db.update(
      'notifications',
      {'is_read': 1},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> delete(int id) async {
    final db = await database;
    return await db.delete('notifications', where: 'id = ?', whereArgs: [id]);
  }
}
