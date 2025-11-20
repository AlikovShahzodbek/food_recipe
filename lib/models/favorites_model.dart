import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:practick_project/models/food_content_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesModel extends ChangeNotifier {
  static final List<FoodContentModel> _favorites = [];
  static final ValueNotifier<List<FoodContentModel>> notifier = ValueNotifier(
    _favorites,
  );

  Future<void> saveFavorite() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> favoriteIds = _favorites
        .map((id) => json.encode(id.toJson()))
        .toList();
    await prefs.setStringList('favorites', favoriteIds);
  }

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? favoriteIds = prefs.getStringList('favorites');
    if (favoriteIds != null) {
      _favorites.clear();
      _favorites.addAll(
        favoriteIds.map((id) => FoodContentModel.fromJson(json.decode(id))),
      );
    }
  }

  static void addFavorite(FoodContentModel item) {
    if (!_favorites.any((element) => element.id == item.id)) {
      _favorites.add(item);
      FavoritesModel().saveFavorite();
    }
  }

  static void removeFavorite(FoodContentModel item) {
    _favorites.removeWhere((element) => element.id == item.id);
    FavoritesModel().saveFavorite();
  }

  static bool isFavorite(FoodContentModel item) {
    return _favorites.any((element) => element.id == item.id);
  }

  static List<FoodContentModel> get all => _favorites;
}
