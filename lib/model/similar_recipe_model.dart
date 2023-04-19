class SimilarRecipeModel {
  final int id;
  final String title;
  final int servings;

  SimilarRecipeModel({
    required this.id,
    required this.title,
    required this.servings,
  });

  factory SimilarRecipeModel.fromJson(Map<String, dynamic> json) {
    return SimilarRecipeModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      servings: json['servings'] ?? '',
    );
  }
}
