import 'package:flutter/material.dart';
import 'package:practick_project/components/main_screen/home_page/local_food_card.dart';
import 'package:practick_project/db/controller/local_recipes_data_base.dart';

class LocalFoodCardList extends StatelessWidget {
  const LocalFoodCardList({super.key, required this.localDB});
  final LocalRecipesDatabase localDB;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: localDB.watchAllRecipes(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final recipes = snapshot.data!;
        if (recipes.isEmpty) {
          return const Center(child: Text("No recipes found"));
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
                  title: recipe.name ?? 'No name',
                  category: recipe.category ?? 'No category',
                  area: recipe.area ?? 'No area',
                  id: recipe.id,
                  instruction: recipe.instruction ?? '',
                  ingredients: recipe.ingredients ?? [],
                  measures: recipe.measures ?? [],
                  videoUrl: recipe.videoUrl ?? '',
                  image: recipe.imagePath ?? '',
                ),
              );
            },
          ),
        );
      },
    );
  }
}
