import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:practick_project/models/favorites_model.dart';
import 'package:practick_project/models/food_content_model.dart';

class SaveButton extends StatefulWidget {
  const SaveButton({super.key, required this.meal});

  final FoodContentModel meal;

  @override
  State<SaveButton> createState() => _SaveButtonState();
}

final saveIconDisabled = SvgPicture.asset(
  'assets/icons/outlined_icons/bookmark-outlined.svg',
);

final saveIconEnebled = SvgPicture.asset(
  'assets/icons/active_icons/bookmark-active.svg',
);

final imageDecoration = BoxDecoration(
  shape: BoxShape.circle,
  color: Colors.white,
);

class _SaveButtonState extends State<SaveButton> {
  bool isSaved = false;

  void _toggleSave() {
    setState(() {
      if (isSaved) {
        FavoritesModel.removeFavorite(widget.meal);
        isSaved = false;
      } else {
        FavoritesModel.addFavorite(widget.meal);
        isSaved = true;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    FavoritesModel.notifier.addListener(_update);
  }

  void _update() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final isSaved = FavoritesModel.isFavorite(widget.meal);

    return GestureDetector(
      onTap: _toggleSave,
      child: Container(
        width: 35,
        height: 35,
        decoration: imageDecoration,
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: isSaved ? saveIconEnebled : saveIconDisabled,
        ),
      ),
    );
  }
}
