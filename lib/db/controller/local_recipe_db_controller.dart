import 'package:practick_project/db/model/local_recipes_table.dart';

class LocalRecipeDbController {
  final LocalRecipesTable _dbTable = LocalRecipesTable();

  Future<int> addRecipe(Map<String, dynamic> recipe) {
    return _dbTable.insertRecipe(recipe);
  }

  Future<List<Map<String, dynamic>>> fetchAllRecipes() {
    return _dbTable.getAllRecipes();
  }

  Future<int> deleteRecipe(int id) async {
    return await _dbTable.delete(id);
  }

  Future<Map<String, Object?>?> getById(int id) async {
    return await _dbTable.getById(id);
  }
}
