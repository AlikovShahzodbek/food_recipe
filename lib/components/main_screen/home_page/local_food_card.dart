import 'dart:io';

import 'package:flutter/material.dart';
import 'package:practick_project/Theme/colors.dart';
import 'package:practick_project/models/food_content_model.dart';
import 'package:practick_project/pages/food_page.dart';

class LocalFoodCard extends StatefulWidget {
  const LocalFoodCard({
    super.key,
    required this.title,
    required this.category,
    required this.area,
    required this.id,
    required this.instruction,
    required this.ingredients,
    required this.measures,
    required this.videoUrl,
    required this.image,
  });

  final int id;
  final String title;
  final String category;
  final String area;
  final String image;
  final String instruction;
  final List<String> ingredients;
  final List<String> measures;
  final String videoUrl;

  @override
  State<LocalFoodCard> createState() => _LocalFoodCardState();
}

class _LocalFoodCardState extends State<LocalFoodCard> {
  void _openFoodPage() {
    final meal = FoodContentModel.fromLocal({
      'id': widget.id,
      'name': widget.title,
      'category': widget.category,
      'area': widget.area,
      'instruction': widget.instruction,
      'imagePath': widget.image,
      'videoUrl': widget.videoUrl,
      'ingredients': widget.ingredients,
      'measures': widget.measures,
    });
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => FoodPage(meal: meal)));
  }

  final titletextStyle = TextStyle(
    color: AppColors().black,
    fontWeight: FontWeight.bold,
  );

  final subtitleTextStyle = TextStyle(color: AppColors().grey3);

  @override
  Widget build(BuildContext context) {
    final imageDecoration = BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.white,
    );
    return GestureDetector(
      onTap: () => _openFoodPage(),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Card(
            color: AppColors().white,
            child: Container(
              height: 110,
              width: 250,
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: titletextStyle.copyWith(fontSize: 20),
                      ),
                      Text(widget.area, style: subtitleTextStyle),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('category', style: subtitleTextStyle),
                      Text(widget.category, style: titletextStyle),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: -35,
            right: 15,
            child: Container(
              clipBehavior: Clip.hardEdge,
              width: 90,
              height: 90,
              decoration: imageDecoration,
              child: Image.file(File(widget.image), fit: BoxFit.cover),
            ),
          ),
        ],
      ),
    );
  }
}
