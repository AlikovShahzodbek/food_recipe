import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:practick_project/Theme/colors.dart';
import 'package:practick_project/controllers/filter_controller.dart';

class AddRecipesDropDownButton extends StatefulWidget {
  const AddRecipesDropDownButton({super.key, required this.onSelectedCategory});
  final Function(String?) onSelectedCategory;

  @override
  State<AddRecipesDropDownButton> createState() =>
      _AddRecipesDropDownButtonState();
}

class _AddRecipesDropDownButtonState extends State<AddRecipesDropDownButton> {
  FilterController controller = FilterController();

  @override
  void initState() {
    controller.getRecipeCategory(() {
      setState(() {});
    });
    super.initState();
  }

  final dropDownDecoration = BoxDecoration(
    border: Border.all(width: 1, color: AppColors().grey3),
    borderRadius: BorderRadius.circular(12),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: dropDownDecoration,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            value: controller.selectedCotegory,
            hint: Text(
              "Select a category",
              style: TextStyle(color: AppColors().grey3),
            ),
            isExpanded: true,
            icon: SvgPicture.asset(
              "assets/icons/outlined_icons/arrow-down.svg",
              colorFilter: ColorFilter.mode(AppColors().grey3, BlendMode.srcIn),
            ),
            items: controller.categoryList
                .where((category) => category != "All")
                .map(
                  (category) => DropdownMenuItem<String>(
                    value: category,
                    child: Text(category),
                  ),
                )
                .toList(),
            onChanged: (value) {
              setState(() {
                controller.selectedCotegory = value;
              });
              widget.onSelectedCategory(value);
            },
          ),
        ),
      ),
    );
  }
}
