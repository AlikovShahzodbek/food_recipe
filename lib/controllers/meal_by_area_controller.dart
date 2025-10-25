import 'package:dio/dio.dart';
import 'package:practick_project/config/app.dart';
import 'package:practick_project/models/food_content_model.dart';

class MealByAreaController {
  final dio = Dio();

  Future<List<FoodContentModel>> getMealByArea(String area) async {
    final response = await dio.get("${App.filterByArea}$area");
    try {
      if (response.statusCode == 200) {
        final meals = response.data['meals'] as List;
        final futures = meals.map((meal) async {
          final id = meal["idMeal"];
          final response = await dio.get("${App.mealId}$id");
          final fullMeal = FoodContentModel.fromJson(response.data["meals"][0]);
          return fullMeal;
        }).toList();
        List<FoodContentModel> contnetMeals = [];

        contnetMeals = await Future.wait(futures);

        return contnetMeals;
      } else {
        return [];
      }
    } catch (e) {
      throw Exception("Ошибка при получения данные: e");
    }
  }
}
