import 'dart:io';

import 'package:flutter/widgets.dart';

class FoodContentModel {
  FoodContentModel({
    required this.id,
    required this.name,
    required this.cotegory,
    required this.area,
    required this.instruction,
    required this.image,
    required this.video,
    required this.ingredients,
    required this.measures,
    required this.source,
  });

  final String id;
  final String name;
  final String cotegory;
  final String area;
  final String instruction;
  final Image image;
  final String video;
  final List<String> ingredients;
  final List<String> measures;
  final String source;

  factory FoodContentModel.fromJson(Map<String, dynamic> json) {
    List<String> ingraidents = [];
    List<String> measures = [];

    for (var i = 1; i <= 20; i++) {
      final ingradient = json['strIngredient$i'];
      final measure = json['strMeasure$i'];

      if (ingradient != null && ingradient.toString().trim().isNotEmpty) {
        ingraidents.add(ingradient.toString());
        measures.add(measure?.toString() ?? '');
      }
    }

    return FoodContentModel(
      id: json['idMeal'] ?? '',
      name: json['strMeal'] ?? '',
      cotegory: json['strCategory'] ?? '',
      area: json['strArea'] ?? '',
      instruction: json['strInstructions'] ?? '',
      image: Image.network(json['strMealThumb'] ?? '', fit: BoxFit.cover),
      video: json['strYoutube'] ?? '',
      source: json['strSource'] ?? '',
      ingredients: ingraidents,
      measures: measures,
    );
  }

  factory FoodContentModel.fromLocal(Map<String, dynamic> json) {
    return FoodContentModel(
      id: json['id']?.toString() ?? '',
      name: json['name'] ?? '',
      cotegory: json['category'] ?? '',
      area: json['area'] ?? 'Local',
      instruction: json['instruction'] ?? '',
      image: Image.file(File(json['imagePath'] ?? ''), fit: BoxFit.cover),
      video: json['videoUrl'] ?? '',
      ingredients: (json['ingredients'] as List?)?.cast<String>() ?? [],
      measures: (json['measures'] as List?)?.cast<String>() ?? [],
      source: '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idMeal': id,
      'strMeal': name,
      'strCategory': cotegory,
      'strArea': area,
      'strInstructions': instruction,
      'strMealThumb': (image.image as NetworkImage).url,
      'strYoutube': video,
      'strSource': source,
      'ingradients': ingredients,
      'measures': measures,
    };
  }
}
