import 'package:dio/dio.dart';
import 'package:practick_project/models/recipe_country_model.dart';

class RecipeCountryController {
  final dio = Dio();

  Future<List<RecipeCountryModel>> getRecipeCountry() async {
    final responce = await dio.get(
      'https://www.themealdb.com/api/json/v1/1/list.php?a=list',
    );
    if (responce.statusCode == 200) {
      final data = responce.data['meals'] as List;
      final country = data
          .map((item) => RecipeCountryModel(country: item['strArea']))
          .toList();
      return country;
    } else {
      throw Exception('Ошибка при получении данных');
    }
  }
}
