import 'package:dio/dio.dart';
import 'package:practick_project/models/recipe_cotegory_model.dart';

class RecipeCotegoryController {
  final dio = Dio();

  Future<List<RecipeCotegoryModel>> getRecipeCategory() async {
    final responce = await dio.get(
      'https://www.themealdb.com/api/json/v1/1/categories.php',
    );
    if (responce.statusCode == 200) {
      final data = responce.data['categories'] as List;
      final category = data
          .map((item) => RecipeCotegoryModel(category: item['strCategory']))
          .toList();
      return category;
    } else {
      throw Exception('Ошибка при получении данных');
    }
  }

}