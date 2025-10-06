import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:practick_project/Theme/colors.dart';

class FoodCard extends StatefulWidget {
  const FoodCard({
    super.key,
    required this.title,
    required this.cotegory,
    required this.image,
  });

  final String title;
  final String cotegory;
  final Image image;

  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  final titletextStyle = TextStyle(
    color: AppColors().black,
    fontWeight: FontWeight.bold,
  );

  final subtitleTextStyle = TextStyle(color: AppColors().grey3);
  final saveIcon = SvgPicture.asset(
    'assets/icons/outlined_icons/bookmark-outlined.svg',
  );

  @override
  Widget build(BuildContext context) {
    final imageDecoration = BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.white,
    );

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Card(
          child: Container(
            padding: EdgeInsets.only(top: 80),
            width: 160,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
                  child: Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    style: titletextStyle.copyWith(fontSize: 16),
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
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: imageDecoration,
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: saveIcon,
                              ),
                            ),
                          ),
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
    );
  }
}
