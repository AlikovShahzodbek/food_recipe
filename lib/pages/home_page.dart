import 'package:flutter/material.dart';
import 'package:practick_project/Theme/colors.dart';
import 'package:practick_project/components/main_screen/home_page/custom_app_bar.dart';
import 'package:practick_project/components/main_screen/home_page/custom_tab_bar.dart';
import 'package:practick_project/components/main_screen/home_page/home_food_card_list.dart';
import 'package:practick_project/components/main_screen/home_page/local_food_card_list.dart';
import 'package:practick_project/components/main_screen/home_page/searcher_and_filter.dart';
import 'package:practick_project/db/controller/local_recipes_data_base.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  LocalRecipesDatabase localDB = LocalRecipesDatabase();

  String selectedArea = 'All';
  String selectedCategory = "All";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsGeometry.fromLTRB(20, 70, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomAppBar(),
                    SizedBox(height: 30),
                    SearcherAndFilter(
                      readOnly: true,
                      selectedCategory: (category) {
                        setState(() {
                          selectedCategory = category;
                        });
                      },
                      searchMeal: (_) {},
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              CustomTabBar(
                onSelectedCountry: (country) {
                  setState(() {
                    selectedArea = country;
                  });
                },
              ),
              SizedBox(height: 20),
              SizedBox(
                
                child: HomeFoodCardList(
                  selectedCountry: selectedArea,
                  selectedCategory: selectedCategory,
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'New Recipes',
                  style: TextStyle(
                    color: AppColors().black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(height: 10),
              LocalFoodCardList(localDB: localDB),
            ],
          ),
        ),
      ),
    );
  }
}
