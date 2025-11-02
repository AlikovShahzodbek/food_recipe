import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:practick_project/db/model/local_recipes_table.dart';

part 'local_recipes_data_base.g.dart';

@DriftDatabase(tables: [LocalRecipes])
class LocalRecipesDatabase extends _$LocalRecipesDatabase {
  LocalRecipesDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<int> insertRecipe(LocalRecipesCompanion recipe) =>
      into(localRecipes).insert(recipe);

  Future<List<LocalRecipe>> getAllRecipes() => select(localRecipes).get();

  Future<int> deleteAll() => delete(localRecipes).go();

  Stream<List<LocalRecipe>> watchAllRecipes() => select(localRecipes).watch();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'local_recipes.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
