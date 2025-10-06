import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:practick_project/Theme/colors.dart';
import 'package:practick_project/controllers/filter_controller.dart';

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  FilterController controller = FilterController();

  @override
  Widget build(BuildContext context) {
    final filterDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: AppColors().primary100,
    );
    var svgPicture = SvgPicture.asset(
      "assets/icons/outlined_icons/filter-outlined.svg",
      colorFilter: ColorFilter.mode(AppColors().white, BlendMode.srcIn),
    );
    return InkWell(
      onTap: () => controller.showFilterOptions(context),
      overlayColor: WidgetStatePropertyAll(Colors.transparent),
      child: Container(
        width: 45,
        height: 45,
        decoration: filterDecoration,
        child: Padding(padding: const EdgeInsets.all(12), child: svgPicture),
      ),
    );
  }
}
