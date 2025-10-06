import 'package:flutter/material.dart';
import 'package:practick_project/components/main_screen/home_page/custom_app_bar.dart';
import 'package:practick_project/components/main_screen/home_page/custom_tab_bar.dart';
import 'package:practick_project/components/main_screen/home_page/food_card_list.dart';
import 'package:practick_project/components/main_screen/home_page/searcher_and_filter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                    SearcherAndFilter(readOnly: true),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              CustomTabBar(),
              SizedBox(height: 20),
              FoodCardList(),
            ],
          ),
        ),
      ),
    );
  }
}
