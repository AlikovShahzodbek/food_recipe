import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:practick_project/Theme/colors.dart';

class Searcher extends StatelessWidget {
  const Searcher({super.key, required this.readOnly, required this.searchMeal});
  final bool readOnly;
  final Function(String query) searchMeal;

  @override
  Widget build(BuildContext context) {

    final searchDecoration = InputDecoration(
      prefixIcon: Padding(
        padding: const EdgeInsets.all(11),
        child: SvgPicture.asset(
          "assets/icons/outlined_icons/search-outlined.svg",
          colorFilter: ColorFilter.mode(AppColors().grey4, BlendMode.srcIn),
          height: 18,
          width: 18,
          fit: BoxFit.cover,
        ),
      ),
      hintText: "Search recipe",
      hintStyle: TextStyle(color: AppColors().grey4),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      isCollapsed: true,
      contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors().primary80, width: 2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors().grey3),
      ),
    );
    return TextField(
      readOnly: readOnly,
      decoration: searchDecoration,
      cursorColor: AppColors().grey1,
      onChanged: searchMeal,
    );
  }
}
