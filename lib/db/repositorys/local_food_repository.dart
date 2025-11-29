import 'package:practick_project/db/models/local_food_model.dart';
import 'package:sqflite/sqflite.dart';

class LocalFoodRepository {
  static Future<Database> _getDatabase() async {
    final database = await openDatabase(
      'local_food.db',
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
        CREATE TABLE local_food (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        cotegory TEXT,
        area TEXT,
        instruction TEXT,
        image TEXT,
        video TEXT,
        ingredients TEXT,
        measures TEXT
        )
     ''');
      },
    );

    return database;
  }

  static Future<List<LocalFoodModel>> getDatabase() async {
    final db = await _getDatabase();
    final result = await db.query('local_food');
    return result.map((json) => LocalFoodModel.fromMap(json)).toList();
  }

  static Future<int> addMeal(LocalFoodModel meal) async {
    final db = await _getDatabase();
    return await db.insert('local_food', meal.toMap());
  }

  static Future<int> updateMeal(LocalFoodModel meal) async {
    final db = await _getDatabase();
    return await db.update(
      "local_food",
      meal.toMap(),
      where: 'id = ?',
      whereArgs: [meal.id],
    );
  }

  static Future<int> deleteMeal(int id) async {
    final db = await _getDatabase();
    return await db.delete('local_food', where: 'id = ?', whereArgs: [id]);
  }
}
