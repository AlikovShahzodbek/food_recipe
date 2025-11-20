import 'package:flutter/foundation.dart';
import 'package:practick_project/db/model/local_recipes_table.dart';

class LocalRecipeDbController extends ChangeNotifier {
  static final LocalRecipeDbController _instance =
      LocalRecipeDbController._internal();
  factory LocalRecipeDbController() => _instance;
  LocalRecipeDbController._internal();

  final LocalRecipesTable _dbTable = LocalRecipesTable();
  List<Map<String, dynamic>> _recipes = [];

  List<Map<String, dynamic>> get recipes => _recipes;

  Future<int> addRecipe(Map<String, dynamic> recipe) async {
    final id = await _dbTable.insertRecipe(recipe);
    await _loadRecipes();
    notifyListeners();
    return id;
  }

  Future<void> _loadRecipes() async {
    _recipes = await _dbTable.getAllRecipes();
  }

  Future<List<Map<String, dynamic>>> fetchAllRecipes() async {
    await _loadRecipes();
    return _recipes;
  }

  Future<int> deleteRecipe(int id) async {
    final result = await _dbTable.delete(id);
    await _loadRecipes();
    notifyListeners();
    return result;
  }

  Future<Map<String, Object?>?> getById(int id) async {
    return await _dbTable.getById(id);
  }
}
