import 'package:flutter/material.dart';
import 'package:practick_project/components/main_screen/home_page/local_food_card.dart';
import 'package:practick_project/db/controller/local_recipe_db_controller.dart';

class LocalFoodCardList extends StatefulWidget {
  const LocalFoodCardList({super.key});

  @override
  State<LocalFoodCardList> createState() => _LocalFoodCardListState();
}

class _LocalFoodCardListState extends State<LocalFoodCardList> {
  final controller = LocalRecipeDbController();

  @override
  void initState() {
    super.initState();
    controller.fetchAllRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        final recipes = controller.recipes;

        if (recipes.isEmpty) {
          return const Center(child: Text("No local recipes yet"));
        }

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
                  title: recipe['name'],
                  category: recipe['category'],
                  area: recipe['area'],
                  id: recipe['id'],
                  instruction: recipe['instruction'],
                  ingredients: recipe['ingredients'].split(','),
                  measures: recipe['measures'].split(','),
                  videoUrl: recipe['videoUrl'],
                  image: recipe['imagePath'],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
