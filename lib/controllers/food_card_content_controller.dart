import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:practick_project/models/food_card_content_model.dart';

class FoodCardContentController {
  final dio = Dio();

  Future<List<FoodCardContentModel>> getMeals() async {
    final responce = await dio.get(
      'https://www.themealdb.com/api/json/v1/1/search.php?s=',
    );
    if (responce.statusCode == 200) {
      final data = responce.data['meals'] as List;
      final meals = data
          .map(
            (item) => FoodCardContentModel(
              title: item['strMeal'],
              cotegory: item['strCategory'],
              image: Image.network(item['strMealThumb']),
            ),
          )
          .toList();

      return meals;
    } else {
      throw Exception('Ошибка при получении данных');
    }
  }
}
