import 'package:dio/dio.dart';
import 'package:practick_project/config/app.dart';
import 'package:practick_project/models/food_content_model.dart';

class MealByCotegoryController {
  final dio = Dio();

  Future<List<FoodContentModel>> getMealByCotegory(
    String category, {
    String? area,
  }) async {
    if (category.isEmpty || category == 'All') return [];
    try {
      final response = await dio.get("${App.filterByCotegory}$category");

      if (response.statusCode == 200) {
        final meal = response.data["meals"] as List;
        final futured = meal.map((meal) async {
          final id = meal["idMeal"];
          final response = await dio.get("${App.mealId}$id");
          final fullMeal = FoodContentModel.fromJson(response.data["meals"][0]);
          return fullMeal;
        }).toList();

        List<FoodContentModel> contnetMeals = [];

        contnetMeals = await Future.wait(futured);

        if (area != null && area != 'All') {
          contnetMeals = contnetMeals
              .where((meal) => meal.area == area)
              .toList();
        }

        return contnetMeals;
      } else {
        return [];
      }
    } catch (e) {
      throw Exception("Ошибка при получения данные: e");
    }
  }
}
