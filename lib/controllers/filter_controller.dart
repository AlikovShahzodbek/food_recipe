import 'package:flutter/material.dart';
import 'package:practick_project/Theme/colors.dart';
import 'package:practick_project/components/main_screen/home_page/custom_filter_wrap.dart';
import 'package:practick_project/controllers/recipe_cotegory_controller.dart';

class FilterController {
  RecipeCotegoryController controller = RecipeCotegoryController();

  Future<void> getRecipeCategory() async {
    final cotegory = await controller.getRecipeCategory();
    _categoryList.addAll(cotegory.map((element) => element.category));
  }

  int selectedIndex = 0;

  final _buttonStyle = ButtonStyle(
    backgroundColor: WidgetStatePropertyAll(AppColors().primary100),
    minimumSize: WidgetStatePropertyAll(Size(243, 54)),
    shape: WidgetStatePropertyAll(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    ),
  );

  final _titleStyle = TextStyle(
    fontWeight: FontWeight.bold,
    color: AppColors().black,
  );

  final List<String> _timeList = ['All', 'Newest', 'Oldest', 'Popularity'];
  final List<String> _rateList = ['5', '4', '3', '2', '1'];
  final List<String> _categoryList = ['All'];

  final _decoration = BoxDecoration(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(50),
      topRight: Radius.circular(50),
    ),
  );

  void showFilterOptions(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      useRootNavigator: true,
      context: context,
      builder: (context) => DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.6,
        maxChildSize: 0.9,
        builder: (context, ScrollController scrollController) {
          return SingleChildScrollView(
            child: Container(
              decoration: _decoration,
              child: Padding(
                padding: EdgeInsetsGeometry.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Filter Search',
                        style: _titleStyle.copyWith(fontSize: 20),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text("Time", style: _titleStyle),
                    SizedBox(height: 10),
                    CustomWrap(
                      selectedIndex: selectedIndex,
                      item: _timeList,
                      indexKey: 'time_index',
                    ),
                    SizedBox(height: 20),
                    Text("Rate", style: _titleStyle),
                    SizedBox(height: 10),
                    CustomWrap(
                      selectedIndex: selectedIndex,
                      item: _rateList,
                      indexKey: 'rate_index',
                    ),
                    SizedBox(height: 20),
                    Text("Category", style: _titleStyle),
                    SizedBox(height: 10),
                    CustomWrap(
                      selectedIndex: selectedIndex,
                      item: _categoryList,
                      indexKey: 'category_index',
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: _buttonStyle,
                        child: Text(
                          "Filter",
                          style: TextStyle(
                            color: AppColors().white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
