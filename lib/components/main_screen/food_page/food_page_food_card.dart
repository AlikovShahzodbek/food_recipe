import 'package:flutter/material.dart';
import 'package:practick_project/Theme/colors.dart';
import 'package:practick_project/components/save_button.dart';
import 'package:practick_project/models/food_content_model.dart';

class FoodPageFoodCard extends StatefulWidget {
  const FoodPageFoodCard({
    super.key,
    required this.image,
    required this.cotegory,
    required this.meal,
  });
  final String cotegory;
  final Image image;
  final FoodContentModel meal;

  @override
  State<FoodPageFoodCard> createState() => _FoodPageFoodCardState();
}

class _FoodPageFoodCardState extends State<FoodPageFoodCard> {
  final _cardDecoration = BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(15)),
    color: const Color.fromARGB(97, 0, 0, 0),
  );

  final _titleStyle = TextStyle(
    fontWeight: FontWeight.bold,
    color: AppColors().white,
  );

  final _categoryStyle = TextStyle(
    color: AppColors().grey4,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Stack(
        children: [
          Container(
            height: 170,
            width: double.infinity,
            decoration: _cardDecoration,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              child: widget.image,
            ),
          ),
          ColorFiltered(
            colorFilter: ColorFilter.mode(
              const Color.fromARGB(0, 0, 0, 0),
              BlendMode.darken,
            ),
            child: Container(
              height: 170,
              width: double.infinity,
              decoration: _cardDecoration,
            ),
          ),
          Positioned(
            bottom: 10, // Располагаем Column внизу
            left: 10,
            right: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(child: Text("Category", style: _categoryStyle)),
                    Text(
                      widget.cotegory,
                      style: _titleStyle.copyWith(fontSize: 16),
                    ),
                    SizedBox(width: 15),
                    SaveButton(meal: widget.meal),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
