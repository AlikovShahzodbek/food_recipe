import 'package:practick_project/config/app.dart';
import 'package:practick_project/db/controller/local_recipe_db_controller.dart';
import 'package:practick_project/models/food_content_model.dart';
import 'package:practick_project/services/fetch_json.dart';

class MealRepository {
  MealRepository(this.controller);
  final LocalRecipeDbController controller;

  Future<FoodContentModel?> findMeal(int id) async {
    final local = await controller.getById(id);
    if (local != null) {
      return FoodContentModel.fromLocal(local);
    }

    final url = "${App.mealId}$id";
    final json = await FetchJson().fetchJson(url);

    if (json != null && json['meals'] != null) {
      return FoodContentModel.fromJson(json['meals'][0]);
    }

    return null;
  }
}
