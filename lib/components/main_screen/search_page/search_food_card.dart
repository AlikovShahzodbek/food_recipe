import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:practick_project/Theme/colors.dart';
import 'package:practick_project/controllers/food_card_content_controller.dart';
import 'package:practick_project/models/food_content_model.dart';
import 'package:practick_project/pages/food_page.dart';

class SearchFoodCard extends StatefulWidget {
  const SearchFoodCard({
    super.key,
    required this.title,
    required this.area,
    required this.image,
    required this.meal,
  });

  final String title;
  final String area;
  final Image image;
  final FoodContentModel meal;

  @override
  State<SearchFoodCard> createState() => _SearchFoodCardState();
}

FoodCardContentController controller = FoodCardContentController();

class _SearchFoodCardState extends State<SearchFoodCard> {
  final _cardDecoration = BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(15)),
    color: const Color.fromARGB(97, 0, 0, 0),
  );

  final _titleStyle = TextStyle(
    fontWeight: FontWeight.bold,
    color: AppColors().white,
  );

  final _areaStyle = TextStyle(
    color: AppColors().grey4,
    fontWeight: FontWeight.bold,
  );

  void _openFoodPage() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => FoodPage(meal: widget.meal)));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _openFoodPage(),
      child: Padding(
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
                  AutoSizeText(
                    widget.title,
                    style: _titleStyle.copyWith(fontSize: 16),
                    maxLines: 2,
                  ),
                  SizedBox(height: 10),
                  Text(widget.area, style: _areaStyle),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
