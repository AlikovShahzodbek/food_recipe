import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalRecipesTable {
  Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;

    _db = await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final dataPath = await getDatabasesPath();
    final path = join(dataPath, 'local_recipe.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE local_recipes (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            category TEXT,
            area TEXT,
            instruction TEXT,
            ingredients TEXT,
            measures TEXT,
            imagePath TEXT,
            videoUrl TEXT
          )
        ''');
      },
    );
  }

  Future<int> insertRecipe(Map<String, dynamic> recipe) async {
    var db = await database;
    return await db.insert('local_recipes', recipe);
  }

  Future<List<Map<String, dynamic>>> getAllRecipes() async {
    var db = await database;
    return await db.query('local_recipes');
  }

  Future<int> delete(int id) async {
    var db = await database;
    return await db.delete('local_recipes', where: 'id = ?', whereArgs: [id]);
  }

  Future<Map<String, Object?>?> getById(int id) async {
    final db = await database;

    final result = await db.query(
      'local_recipes',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (result.isNotEmpty) {
      return result.first;
    }
    return null;
  }
}
