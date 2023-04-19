import 'dart:convert';

import 'package:http/http.dart' as http;

Future<String> fetchTrivia(String apiKey) async {
  final response = await http.get(Uri.parse(
      'https://api.spoonacular.com/food/trivia/random?apiKey=$apiKey'));
  if (response.statusCode == 200) {
    final json = jsonDecode(response.body);
    final trivia = json['text'] as String;
    return trivia;
  } else {
    throw Exception('Failed to fetch trivia');
  }
}
