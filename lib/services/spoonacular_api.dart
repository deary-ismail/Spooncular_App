import 'dart:convert';

import 'package:http/http.dart' as http;

class SpoonacularApi {
  static const apiKey = '6f1f97066dfd4414b1710984979febb2';
  static const baseUrl = 'https://api.spoonacular.com';

  static Future<http.Response> getRecipes(int number) async {
    final response = await http.get(Uri.parse(
        '$baseUrl/recipes/random?apiKey=$apiKey&number=$number&tags=dinner'));
    return response;
  }
}
