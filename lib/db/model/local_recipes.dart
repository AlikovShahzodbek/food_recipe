import 'package:isar/isar.dart';

part 'local_recipes.g.dart';

@Collection()
class LocalRecipes {
  LocalRecipes({
     this.area,
     this.name,
    this.id,
    this.category,
     this.instruction,
     this.ingredients,
     this.measures,
    this.imagePath,
    this.videoUrl,
  });

  Id? id = Isar.autoIncrement;

  String? name;
  String? category;
   String? area;
   String? instruction;

  @Enumerated(EnumType.name)
   List<String>? ingredients; // Список ингредиентов

  @Enumerated(EnumType.name)
   List<String>? measures; // Список мер

  String? imagePath;
  String? videoUrl;
}
