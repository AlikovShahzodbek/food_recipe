import 'dart:async';
import 'package:flutter/material.dart';
import 'package:practick_project/Theme/colors.dart';
import 'package:practick_project/Theme/text_filed_theme.dart';
import 'package:practick_project/components/main_screen/add_recipes_page/add_recipe_foto.dart';
import 'package:practick_project/components/main_screen/add_recipes_page/add_recipe_youtube_video.dart';
import 'package:practick_project/components/main_screen/add_recipes_page/add_recipes_drop_down_button.dart';
import 'package:practick_project/components/main_screen/add_recipes_page/add_recipes_ingradient_list.dart';
import 'package:practick_project/db/controller/local_recipe_db_controller.dart';
import 'package:practick_project/db/controller/notifications_db_controller.dart';
import 'package:practick_project/models/food_content_model.dart';
import 'package:practick_project/services/notification_service.dart';

class AddRecipe extends StatefulWidget {
  const AddRecipe({super.key});

  @override
  State<AddRecipe> createState() => _AddRecipeState();
}

class _AddRecipeState extends State<AddRecipe> {
  final _nameController = TextEditingController();
  final _areaController = TextEditingController();
  final _instructionController = TextEditingController();
  int _resetKey = 0;
  bool _isSaving = false;
  double _progress = 0.0;
  Timer? _progressTimer;
  String? _category;
  String? _imagePath;
  String? _videoUrl;
  List<String> _ingredients = [];
  List<String> _measures = [];
  FoodContentModel? meal;

  bool get _isFormValid {
    return _nameController.text.trim().isNotEmpty &&
        _category != null &&
        _areaController.text.trim().isNotEmpty &&
        _instructionController.text.trim().isNotEmpty &&
        _ingredients.isNotEmpty &&
        _measures.isNotEmpty &&
        (_imagePath != null && _imagePath!.isNotEmpty ||
            _videoUrl != null && _videoUrl!.isNotEmpty);
  }

  void saveMeal() async {
    if (_isSaving) return;
    setState(() {
      _isSaving = true;
      _progress = 0.0;
    });

    _progressTimer = Timer.periodic(const Duration(milliseconds: 150), (timer) {
      if (_progress < 0.9) {
        setState(() {
          _progress += 0.05;
        });
      }
    });

    final recipeData = {
      'name': _nameController.text.trim(),
      'category': _category,
      'area': _areaController.text.trim(),
      'instruction': _instructionController.text.trim(),
      'ingredients': _ingredients.join(','), // список → строку
      'measures': _measures.join(','),
      'imagePath': _imagePath,
      'videoUrl': _videoUrl,
    };

    await LocalRecipeDbController().addRecipe(recipeData);

    try {
      final mealName = _nameController.text.trim();
      final mealCotegory = _category;
      final recipeId = await LocalRecipeDbController().addRecipe(recipeData);

      _progressTimer?.cancel();
      setState(() {
        _progress = 1.0;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Recipe saved successfully!")),
        );
        await NotificationService().showNotification(
          title: 'Added New Recipe: $mealName',
          body: "Cotegory: $mealCotegory",
        );
        await NotificationsDbController().saveNotificationToDB(
          type: 'added_meal',
          mealId: recipeId.toString(),
          mealName: mealName,
        );
      }

      setState(() {
        _nameController.clear();
        _areaController.clear();
        _instructionController.clear();
        _category = null;
        _imagePath = null;
        _videoUrl = null;
        _ingredients.clear();
        _measures.clear();
        _resetKey++;
      });
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Ошибка при сохранении: $e")));
      }
    } finally {
      setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add new recipe"),
          centerTitle: true,
          elevation: 0,
          scrolledUnderElevation: 0,
          surfaceTintColor: Colors.transparent,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Text(
                  "Name Meal",
                  style: TextStyle(
                    color: AppColors().black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _nameController,
                  onChanged: (_) => setState(() {}),
                  decoration: TextFiledTheme().textFiledTheme.copyWith(
                    hintText: "Enter Name Meal",
                    hintStyle: TextStyle(color: AppColors().grey3),
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  "Category",
                  style: TextStyle(
                    color: AppColors().black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 10),
                AddRecipesDropDownButton(
                  key: ValueKey(_resetKey),
                  onSelectedCategory: (String? category) {
                    setState(() {
                      _category = category;
                    });
                  },
                ),
                SizedBox(height: 30),
                Text(
                  "Area/Cuisine",
                  style: TextStyle(
                    color: AppColors().black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _areaController,
                  onChanged: (_) => setState(() {}),
                  decoration: TextFiledTheme().textFiledTheme.copyWith(
                    hintText: "e.g. Italian",
                    hintStyle: TextStyle(color: AppColors().grey3),
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  "Step-by-step instructions",
                  style: TextStyle(
                    color: AppColors().black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _instructionController,
                  onChanged: (_) => setState(() {}),
                  maxLines: 10,
                  decoration: TextFiledTheme().textFiledTheme.copyWith(
                    hintText: "Describe the cooking steps...",
                    hintStyle: TextStyle(color: AppColors().grey3),
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  "List of ingredients",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: 10),
                AddRecipesIngradientList(
                  key: ValueKey('list_$_resetKey'),
                  onListChanged: (list) {
                    _ingredients = list.map((meal) => meal.ingradient).toList();
                    _measures = list.map((meal) => meal.quantity).toList();
                  },
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    AddRecipeFoto(
                      key: ValueKey('foto_$_resetKey'),
                      onSelectedImage: (String path) {
                        setState(() {
                          _imagePath = path;
                        });
                      },
                    ),
                    SizedBox(width: 15),
                    AddRecipeYoutubeVideo(
                      key: ValueKey("video_$_resetKey"),
                      onSelectedVideo: (String url) {
                        setState(() {
                          _videoUrl = url;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          AppColors().primary100,
                        ),
                        minimumSize: WidgetStatePropertyAll(Size(243, 54)),
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      onPressed: _isFormValid ? () => saveMeal() : null,
                      child: _isSaving
                          ? Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                LinearProgressIndicator(
                                  value: _progress,
                                  backgroundColor: Colors.white24,
                                  color: Colors.white,
                                  minHeight: 5,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  "Saving... ${(_progress * 100).toInt()}%",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            )
                          : const Text(
                              "Save a meal",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
