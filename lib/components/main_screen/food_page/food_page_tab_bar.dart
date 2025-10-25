import 'package:flutter/material.dart';
import 'package:practick_project/Theme/colors.dart';
import 'package:practick_project/components/main_screen/food_page/ingradient_list.dart';
import 'package:practick_project/models/food_content_model.dart';

class FoodPageTabBar extends StatefulWidget {
  const FoodPageTabBar({super.key, required this.meal});

  final FoodContentModel meal;

  @override
  State<FoodPageTabBar> createState() => _FoodPageTabBarState();
}

class _FoodPageTabBarState extends State<FoodPageTabBar> {
  final List<String> _tabContent = ['Ingrident', 'Procedure'];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(
            height: 40,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: _tabContent.length,
              itemBuilder: (context, index) {
                final isSelected = _selectedIndex == index;
                return GestureDetector(
                  onTap: () {
                    _selectedIndex = index;
                    setState(() {});
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 50),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors().primary100
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      constraints: BoxConstraints(minWidth: 150),
                      child: Center(
                        child: Text(
                          _tabContent[index],
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
                );
              },
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: _selectedIndex == 0
                ? IngradientList(meal: widget.meal)
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(widget.meal.instruction),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
