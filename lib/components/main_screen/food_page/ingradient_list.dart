import 'package:flutter/material.dart';
import 'package:practick_project/components/main_screen/food_page/ingradient_card.dart';
import 'package:practick_project/models/food_content_model.dart';

class IngradientList extends StatelessWidget {
  const IngradientList({super.key, required this.meal});

  final FoodContentModel meal;

  @override
  Widget build(BuildContext context) {
    final ingradients = meal.ingredients;
    final measures = meal.measures;

    return ListView.builder(
      shrinkWrap: true,
      itemCount: meal.ingredients.length,
      itemBuilder: (context, index) {
        return IngradientCard(
          ingradients: ingradients[index],
          measures: measures[index],
        );
      },
    );
  }
}
