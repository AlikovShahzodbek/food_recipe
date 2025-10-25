import 'package:flutter/material.dart';
import 'package:practick_project/Theme/colors.dart';
import 'package:practick_project/controllers/recipe_country_controller.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key, required this.onSelectedCountry});

  final Function(String country) onSelectedCountry;

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  RecipeCountryController controller = RecipeCountryController();
  final List<String> recipeCountry = ["All"];

  int selectedindex = 0;

  Future<void> loadCountry() async {
    final country = await controller.getRecipeCountry();
    recipeCountry.addAll(country.map((element) => element.country));
    setState(() {});
  }

  @override
  void initState() {
    loadCountry();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: recipeCountry.length,
        itemBuilder: (context, index) {
          final isSelected = selectedindex == index;
          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? 20 : 0,
              right: index == recipeCountry.length - 1 ? 20 : 0,
            ),
            child: GestureDetector(
              onTap: () {
                selectedindex = index;
                widget.onSelectedCountry(recipeCountry[index]);
                setState(() {});
              },
              child: Container(
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors().primary100
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  constraints: BoxConstraints(minWidth: 75),
                  child: Center(
                    child: Text(
                      recipeCountry[index],
                      style: TextStyle(
                        fontSize: 15,
                        color: isSelected
                            ? AppColors().white
                            : AppColors().primary100,
                        fontWeight: isSelected
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
