import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:practick_project/Theme/colors.dart';
import 'package:practick_project/components/main_screen/favorites_page/favorites_food_card_list.dart';
import 'package:practick_project/models/favorites_model.dart';
import 'package:practick_project/models/food_content_model.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final favoritesTitle = TextStyle(fontWeight: FontWeight.bold);

  List<FoodContentModel> meals = [];
  bool isLoading = true;

  Future<void> _loadMeals() async {
    await FavoritesModel().loadFavorites();
    setState(() {
      meals = FavoritesModel.all;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadMeals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Saved recipes", style: favoritesTitle),
        centerTitle: true,
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(color: AppColors().primary100),
            )
          : meals.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/icons/outlined_icons/bookmark-outlined.svg",
                    height: 100,
                    colorFilter: ColorFilter.mode(
                      AppColors().grey4,
                      BlendMode.srcIn,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "No Saved Meals!",
                    style: TextStyle(fontSize: 30, color: AppColors().grey4),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Your favorite recipes will appear here",
                    style: TextStyle(fontSize: 20, color: AppColors().grey4),
                  ),
                ],
              ),
            )
          : Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
              child: Column(children: [FoodCardList(meals: meals)]),
            ),
    );
  }
}
