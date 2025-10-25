import 'package:flutter/material.dart';
import 'package:practick_project/components/main_screen/favorites_page/favorites_food_card.dart';
import 'package:practick_project/models/favorites_model.dart';
import 'package:practick_project/models/food_content_model.dart';

class FoodCardList extends StatefulWidget {
  const FoodCardList({super.key, required this.meals});

  final List<FoodContentModel> meals;

  @override
  State<FoodCardList> createState() => _FoodCardListState();
}

class _FoodCardListState extends State<FoodCardList> {
  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    await FavoritesModel().loadFavorites();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: FavoritesModel.all.length,
        itemBuilder: (context, index) {
          final meal = FavoritesModel.all[index];
          return Padding(
            padding: EdgeInsets.only(
              top: index == 0 ? 20 : 0,
              bottom: index == FavoritesModel.all.length - 1 ? 20 : 0,
            ),
            child: FoodCard(
              title: meal.name,
              cotegory: meal.cotegory,
              image: meal.image,
              meal: meal,
            ),
          );
        },
      ),
    );
  }
}
