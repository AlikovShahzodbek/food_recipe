import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:practick_project/db/model/local_recipes.dart';

class LocalRecipesDataBase {
  static Isar? _isar;

  static Future<Isar> getInstance() async {
    if (_isar != null && _isar!.isOpen) return _isar!;

    final dir = await getApplicationDocumentsDirectory();

    _isar = await Isar.open(
      [LocalRecipesSchema],
      directory: dir.path,
      name: 'local_recipes',
    );

    return _isar!;
  }

  Future<void> saveRecipe(LocalRecipes recipe) async {
    final isar = await getInstance();
    await isar.writeTxn(() async {
      await isar.localRecipes.put(recipe);
    });
  }

  Future<List<LocalRecipes>> getAllRecipes() async {
    final isar = await getInstance();
    return await isar.localRecipes.where().findAll();
  }

  Future<void> clearAll() async {
    final isar = await getInstance();
    await isar.writeTxn(() async {
      await isar.localRecipes.clear();
    });
  }
}
