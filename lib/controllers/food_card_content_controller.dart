import 'package:dio/dio.dart';
import 'package:practick_project/config/app.dart';
import 'package:practick_project/models/food_content_model.dart';

class FoodCardContentController {
  final dio = Dio();

  Future<List<FoodContentModel>> getMeals() async {
    try {
      final responce = await dio.get(App.searchByName);

      final data = responce.data['meals'];
      if (data == null) {
        throw Exception('Блюда не найдены');
      }
      final meals = (data as List)
          .map((item) => FoodContentModel.fromJson(item))
          .toList();
      return meals;
    } catch (e) {
      throw Exception('Ошибка при получении данных: $e');
    }
  }
}
