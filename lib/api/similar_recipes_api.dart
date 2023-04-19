import 'dart:convert';
import 'package:mobile_application_project/model/similar_recipe_model.dart';
import 'package:http/http.dart' as http;

Future<List<SimilarRecipeModel>> getSimilarRecipes(int recipeId) async {
  final url = Uri.parse(
      'https://api.spoonacular.com/recipes/$recipeId/similar?apiKey=6f1f97066dfd4414b1710984979febb2');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body) as List<dynamic>;
    final recipes =
        data.map((json) => SimilarRecipeModel.fromJson(json)).toList();
    return recipes;
  } else {
    throw Exception('Failed to load similar recipes');
  }
}
