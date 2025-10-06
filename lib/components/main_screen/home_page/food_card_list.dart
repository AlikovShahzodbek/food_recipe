import 'package:flutter/material.dart';
import 'package:practick_project/components/main_screen/home_page/food_card.dart';
import 'package:practick_project/controllers/food_card_content_controller.dart';
import 'package:practick_project/models/food_card_content_model.dart';

class FoodCardList extends StatefulWidget {
  const FoodCardList({super.key});

  @override
  State<FoodCardList> createState() => _FoodCardListState();
}

class _FoodCardListState extends State<FoodCardList> {
  final controller = FoodCardContentController();
  List<FoodCardContentModel> meals = [];

  @override
  void initState() {
    super.initState();
    loadMeals();
  }

  Future<void> loadMeals() async {
    final loadedMeals = await controller.getMeals();
    setState(() {
      meals = loadedMeals;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (meals.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return SizedBox(
      height: 250,
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 50),
        scrollDirection: Axis.horizontal,
        itemCount: meals.length,
        itemBuilder: (context, index) {
          final meal = meals[index];
          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? 20 : 0,
              right: index == meals.length - 1 ? 20 : 0,
            ),
            child: FoodCard(
              title: meal.title,
              cotegory: meal.cotegory,
              image: meal.image,
            ),
          );
        },
      ),
    );
  }
}
