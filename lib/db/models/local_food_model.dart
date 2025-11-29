class LocalFoodModel {
  LocalFoodModel({
    this.id,
    required this.name,
    required this.cotegory,
    required this.area,
    required this.instruction,
    required this.image,
    required this.video,
    required this.ingredients,
    required this.measures,
  });

  final int? id;
  final String name;
  final String cotegory;
  final String area;
  final String instruction;
  final String image;
  final String video;
  final List<String> ingredients;
  final List<String> measures;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'cotegory': cotegory,
      'area': area,
      'instruction': instruction,
      'image': image,
      'video': video,
      'ingredients': ingredients.join(','),
      'measures': measures.join(','),
    };
  }

  static LocalFoodModel fromMap(Map<String, dynamic> map) {
    List<String> ingraidents = [];
    List<String> measures = [];

    for (var i = 1; i <= 20; i++) {
      final ingradient = map['strIngredient$i'];
      final measure = map['strMeasure$i'];

      if (ingradient != null && ingradient.toString().trim().isNotEmpty) {
        ingraidents.add(ingradient.toString());
        measures.add(measure?.toString() ?? '');
      }
    }

    return LocalFoodModel(
      id: map['id'],
      name: map['name'],
      cotegory: map['cotegory'],
      area: map['area'],
      instruction: map['instruction'],
      image: map['image'],
      video: map['video'],
      ingredients: ['ingraidents'].toString().split(','),
      measures: ['measures'].toString().split(','),
    );
  }
}
