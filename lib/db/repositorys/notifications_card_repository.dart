import 'package:practick_project/db/models/notifications_card_model.dart';
import 'package:sqflite/sqflite.dart';

class NotificationsCardRepository {
  static Future<Database> _getDatabase() async {
    final database = await openDatabase(
      'notifications_card.db',
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
        CREATE TABLE notifications_card (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT,
          subtitle TEXT,
          isRead INTEGER,
          createdAt TEXT,
          type TEXT,
          mealId INTEGER
        )
        ''');
      },
    );
    return database;
  }

  static Future<List<NotificationsCardModel>> getDatabase() async {
    final db = await _getDatabase();
    final result = await db.query('notifications_card');
    return result.map((json) => NotificationsCardModel.fromMap(json)).toList();
  }

  static Future<int> addNotification(
    NotificationsCardModel notidication,
  ) async {
    final db = await _getDatabase();
    return await db.insert('notifications_card', notidication.toMap());
  }

  static Future<int> deleteNotification(int id) async {
    final db = await _getDatabase();
    return await db.delete(
      'notifications_card',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
