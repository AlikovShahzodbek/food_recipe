import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:practick_project/Theme/colors.dart';
import 'package:practick_project/components/main_screen/food_page/food_page_food_card.dart';
import 'package:practick_project/components/main_screen/food_page/food_page_tab_bar.dart';
import 'package:practick_project/models/food_content_model.dart';
import 'package:url_launcher/link.dart';

class FoodPage extends StatelessWidget {
  const FoodPage({super.key, required this.meal});

  final FoodContentModel meal;

  @override
  Widget build(BuildContext context) {
    final moreIcon = SvgPicture.asset(
      'assets/icons/outlined_icons/more-outlined.svg',
      colorFilter: ColorFilter.mode(AppColors().black, BlendMode.srcIn),
    );
    final foodNameStyle = TextStyle(
      color: AppColors().black,
      fontWeight: FontWeight.bold,
    );

    final buttonDecoration = BoxDecoration(
      color: AppColors().primary100,
      borderRadius: BorderRadius.circular(15),
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(padding: EdgeInsetsGeometry.only(right: 20), child: moreIcon),
        ],
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
        child: Container(
          padding: EdgeInsets.only(top: 20),
          child: Column(
            children: [
              FoodPageFoodCard(
                cotegory: meal.cotegory,
                image: meal.image,
                meal: meal,
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      meal.name,
                      style: foodNameStyle.copyWith(fontSize: 20),
                    ),
                  ),
                  SizedBox(width: 20),
                  Text('(${meal.area})'),
                ],
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Cooking instructions',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors().black,
                            fontSize: 16,
                          ),
                        ),
                        Text('(watch the video)'),
                      ],
                    ),
                  ),
                  Link(
                    uri: Uri.tryParse(meal.video),
                    builder: (context, followLink) {
                      return InkWell(
                        overlayColor: WidgetStatePropertyAll(
                          Colors.transparent,
                        ),
                        onTap: followLink,
                        child: Container(
                          decoration: buttonDecoration,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 10,
                            ),
                            child: Text(
                              "Instructions",
                              style: TextStyle(color: AppColors().white),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 30),
              FoodPageTabBar(meal: meal),
            ],
          ),
        ),
      ),
    );
  }
}
