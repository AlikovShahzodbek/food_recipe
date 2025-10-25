import 'package:flutter/material.dart';
import 'package:practick_project/Theme/colors.dart';
import 'package:practick_project/components/main_screen/search_page/search_food_card.dart';
import 'package:practick_project/controllers/food_card_content_controller.dart';
import 'package:practick_project/controllers/meal_by_cotegory_controller.dart';
import 'package:practick_project/models/food_content_model.dart';

class SearchFoodCardList extends StatefulWidget {
  const SearchFoodCardList({
    super.key,
    required this.selectedCategory,
    required this.searchResult,
    required this.mealsCount,
  });

  final String selectedCategory;
  final String searchResult;
  final Function(int) mealsCount;

  @override
  State<SearchFoodCardList> createState() => _SearchFoodCardListState();
}

class _SearchFoodCardListState extends State<SearchFoodCardList> {
  final allFoodController = FoodCardContentController();
  final byCategoryController = MealByCotegoryController();
  List<FoodContentModel> meals = [];
  bool isLoading = true;

  Future<void> loadMeals() async {
    setState(() => isLoading = true);
    try {
      List<FoodContentModel> loadedMeals = [];

      if (widget.selectedCategory.isNotEmpty &&
          widget.selectedCategory != "All") {
        loadedMeals = await byCategoryController.getMealByCotegory(
          widget.selectedCategory,
        );
      } else {
        loadedMeals = await allFoodController.getMeals();
      }

      setState(() {
        meals = loadedMeals;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        meals = [];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    loadMeals();
  }

  int get mealsCount => meals.length;

  @override
  void didUpdateWidget(covariant SearchFoodCardList oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.selectedCategory != widget.selectedCategory) {
      loadMeals();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Center(
          child: CircularProgressIndicator(color: AppColors().primary100),
        ),
      );
    }

    if (meals.isEmpty) {
      return const Center(child: Text("Information not founded"));
    }

    final filteredMeals = meals.where((meal) {
      final matchCategory =
          widget.selectedCategory == "All" ||
          meal.cotegory == widget.selectedCategory;
      final matchSearch =
          widget.searchResult.isEmpty ||
          meal.name.toLowerCase().contains(widget.searchResult.toLowerCase());
      return matchCategory && matchSearch;
    }).toList();

    widget.mealsCount(filteredMeals.length);

    if (filteredMeals.isEmpty) {
      return const Center(child: Text("No matching recipes found"));
    }

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
      ),
      itemCount: filteredMeals.length,
      itemBuilder: (context, index) {
        final meal = filteredMeals[index];
        return SearchFoodCard(
          title: meal.name,
          area: meal.area,
          image: meal.image,
          meal: meal,
        );
      },
    );
  }
}
