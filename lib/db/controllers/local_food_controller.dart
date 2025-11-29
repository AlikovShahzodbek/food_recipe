import 'package:flutter/material.dart';
import 'package:practick_project/db/models/local_food_model.dart';
import 'package:practick_project/db/repositorys/local_food_repository.dart';

class LocalFoodController extends ChangeNotifier {
  static final LocalFoodController instance = LocalFoodController._internal();
  LocalFoodController._internal();

  List<LocalFoodModel> recipes = [];

  Future<void> load() async {
    recipes = await LocalFoodRepository.getDatabase();
    notifyListeners();
  }

  Future<int> add(LocalFoodModel meal) async {
    final mealId = await LocalFoodRepository.addMeal(meal);
    await load();
    return mealId;
  }
}
