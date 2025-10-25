import 'package:flutter/material.dart';
import 'package:practick_project/Theme/colors.dart';
import 'package:practick_project/components/save_button.dart';
import 'package:practick_project/pages/food_page.dart';
import 'package:practick_project/models/food_content_model.dart';
import 'package:auto_size_text/auto_size_text.dart';

class HomeFoodCard extends StatefulWidget {
  const HomeFoodCard({
    super.key,
    required this.title,
    required this.cotegory,
    required this.image,
    required this.meal,
  });

  final String title;
  final String cotegory;
  final Image image;
  final FoodContentModel meal;

  @override
  State<HomeFoodCard> createState() => _HomeFoodCardState();
}

class _HomeFoodCardState extends State<HomeFoodCard> {
  final titletextStyle = TextStyle(
    color: AppColors().black,
    fontWeight: FontWeight.bold,
  );

  final subtitleTextStyle = TextStyle(color: AppColors().grey3);

  void _openFoodPage() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => FoodPage(meal: widget.meal)));
  }

  @override
  Widget build(BuildContext context) {
    final imageDecoration = BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.white,
    );

    return GestureDetector(
      onTap: () => _openFoodPage(),
      child: Padding(
        padding: const EdgeInsets.only(right: 15),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            Card(
              child: Container(
                padding: EdgeInsets.only(top: 80),
                width: 160,
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
                        child: AutoSizeText(
                          widget.title,
                          textAlign: TextAlign.center,
                          style: titletextStyle.copyWith(fontSize: 16),
                          maxLines: 2,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        spacing: 3,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("cotegory", style: subtitleTextStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  widget.cotegory,
                                  style: titletextStyle.copyWith(fontSize: 14),
                                ),
                              ),
                              SaveButton(meal: widget.meal),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            Positioned(
              top: -45,
              child: Container(
                clipBehavior: Clip.hardEdge,
                width: 110,
                height: 110,
                decoration: imageDecoration,
                child: widget.image,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
