class RecipeCotegoryModel {
  RecipeCotegoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
  });

  final String id;
  final String name;
  final String image;
  final String description;

  factory RecipeCotegoryModel.fromJson(Map<String, dynamic> json) {
    return RecipeCotegoryModel(
      id: json['idCategory'] ?? '',
      name: json['strCategory'] ?? '',
      image: json['strCategoryThumb'] ?? '',
      description: json['strCategoryDescription'] ?? '',
    );
  }
}
