import 'package:flutter/material.dart';
import 'package:practick_project/Theme/colors.dart';
import 'package:practick_project/components/main_screen/home_page/home_food_card.dart';
import 'package:practick_project/controllers/food_card_content_controller.dart';
import 'package:practick_project/controllers/meal_by_area_controller.dart';
import 'package:practick_project/controllers/meal_by_cotegory_controller.dart';
import 'package:practick_project/models/favorites_model.dart';
import 'package:practick_project/models/food_content_model.dart';

class HomeFoodCardList extends StatefulWidget {
  const HomeFoodCardList({
    super.key,
    required this.selectedCountry,
    required this.selectedCategory,
  });

  final String selectedCountry;
  final String selectedCategory;

  @override
  State<HomeFoodCardList> createState() => _HomeFoodCardListState();
}

class _HomeFoodCardListState extends State<HomeFoodCardList> {
  final allFoodController = FoodCardContentController();
  final byAreaController = MealByAreaController();
  final byCategoryController = MealByCotegoryController();
  List<FoodContentModel> meals = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadMeals();

    _loadFavorites();
  }

  Future<void> loadMeals() async {
    setState(() => isLoading = true);
    try {
      List<FoodContentModel> loadedMeals = [];

      if (widget.selectedCategory.isNotEmpty &&
          widget.selectedCategory != 'All') {
        loadedMeals = await byCategoryController.getMealByCotegory(
          widget.selectedCategory,
          area: widget.selectedCountry != "All" ? widget.selectedCountry : null,
        );
      } else if (widget.selectedCountry != 'All') {
        loadedMeals = await byAreaController.getMealByArea(
          widget.selectedCountry,
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

  Future<void> _loadFavorites() async {
    await FavoritesModel().loadFavorites();
    setState(() {});
  }

  @override
  void didUpdateWidget(covariant HomeFoodCardList oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.selectedCountry != widget.selectedCountry ||
        oldWidget.selectedCategory != widget.selectedCategory) {
      loadMeals();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return SizedBox(
        height: 270,
        child: Center(
          child: CircularProgressIndicator(color: AppColors().primary100),
        ),
      );
    }

    if (meals.isEmpty) {
      return SizedBox(
        height: 270,
        child: const Center(child: Text("Information not founded")),
      );
    }
    return SizedBox(
      height: 270,
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
            child: HomeFoodCard(
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
