import 'package:flutter/material.dart';
import 'package:practick_project/components/main_screen/home_page/local_food_card.dart';
import 'package:practick_project/db/controllers/local_food_controller.dart';

class LocalFoodCardList extends StatefulWidget {
  const LocalFoodCardList({super.key});

  @override
  State<LocalFoodCardList> createState() => _LocalFoodCardListState();
}

class _LocalFoodCardListState extends State<LocalFoodCardList> {
  @override
  void initState() {
    super.initState();
    LocalFoodController.instance.addListener(_update);
    LocalFoodController.instance.load(); 
  }

  void _update() {
    setState(() {}); 
  }

  @override
  void dispose() {
    LocalFoodController.instance.removeListener(_update);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final recipes = LocalFoodController.instance.recipes;
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(top: 35),
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? 20 : 0,
              right: index == recipes.length - 1 ? 20 : 0,
            ),
            child: LocalFoodCard(
              title: recipe.name,
              category: recipe.cotegory,
              area: recipe.area,
              id: recipe.id!,
              instruction: recipe.instruction,
              ingredients: recipe.ingredients,
              measures: recipe.measures,
              videoUrl: recipe.video,
              image: recipe.image,
            ),
          );
        },
      ),
    );
  }
}
