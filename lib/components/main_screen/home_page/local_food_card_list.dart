import 'dart:io';

import 'package:flutter/material.dart';
import 'package:practick_project/components/main_screen/home_page/local_food_card.dart';
import 'package:practick_project/db/controller/local_recipes_data_base.dart';

class LocalFoodCardList extends StatelessWidget {
  const LocalFoodCardList({super.key, required this.localDB});
  final LocalRecipesDataBase localDB;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: localDB.getAllRecipes(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Ошибка: ${snapshot.error}'));
        }

        final recipes = snapshot.data ?? [];
        if (recipes.isEmpty) {
          return const Center(child: Text('Рецепты не найдены'));
        }

        return SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(top: 35),
            itemCount: recipes.length,
            itemBuilder: (context, index) {
              final recipe = recipes[index];
              final imageWidget =
                  (recipe.imagePath != null && recipe.imagePath!.isNotEmpty)
                  ? Image.file(File(recipe.imagePath!), fit: BoxFit.cover)
                  : Image.asset('assets/images/default_food.jpg');
              return Padding(
                padding: EdgeInsets.only(
                  left: index == 0 ? 20 : 0,
                  right: index == recipes.length - 1 ? 20 : 0,
                ),
                child: LocalFoodCard(
                  title: recipe.name ?? 'No name',
                  category: recipe.category ?? 'No category',
                  area: recipe.area ?? 'No area',
                  image: imageWidget,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
