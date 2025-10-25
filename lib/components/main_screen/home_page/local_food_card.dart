import 'package:flutter/material.dart';
import 'package:practick_project/Theme/colors.dart';

class LocalFoodCard extends StatefulWidget {
  const LocalFoodCard({
    super.key,
    required this.title,
    required this.category,
    required this.area,
    required this.image,
  });

  final String title;
  final String category;
  final String area;
  final Image image;

  @override
  State<LocalFoodCard> createState() => _LocalFoodCardState();
}

class _LocalFoodCardState extends State<LocalFoodCard> {
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
              child: widget.image,
            ),
          ),
        ],
      ),
    );
  }
}
