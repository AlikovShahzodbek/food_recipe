import 'package:flutter/material.dart';

class FoodCardContentModel {
  const FoodCardContentModel({
    required this.title,
    required this.cotegory,
    required this.image,
  });

  final String title;
  final String cotegory;
  final Image image;
}
