import 'package:flutter/material.dart';
import 'package:practick_project/Theme/colors.dart';
import 'package:practick_project/components/main_screen/home_page/searcher_and_filter.dart';
import 'package:practick_project/components/main_screen/search_page/search_food_card_list.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String selectedCategory = "All";
  String query = '';
  int mealsCount = 0;

  void changeMealsCount(int count) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          mealsCount = count;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(title: Text("Search recipes"), centerTitle: true),
        body: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 17),
              SearcherAndFilter(
                readOnly: false,
                selectedCategory: (category) {
                  setState(() {
                    selectedCategory = category;
                  });
                },
                searchMeal: (result) {
                  setState(() {
                    query = result;
                  });
                },
              ),
              SizedBox(height: 20),
              query.isEmpty
                  ? Text(
                      'Recent Search',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Search Result",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '$mealsCount results',
                          style: TextStyle(color: AppColors().grey2),
                        ),
                      ],
                    ),
              SizedBox(height: 20),
              Expanded(
                child: SearchFoodCardList(
                  selectedCategory: selectedCategory,
                  searchResult: query,
                  mealsCount: changeMealsCount,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
