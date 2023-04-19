import 'dart:convert';

import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> generateMealPlan() async {
  const apiKey = '6f1f97066dfd4414b1710984979febb2';
  final url =
      'https://api.spoonacular.com/mealplanner/generate?apiKey=$apiKey&timeFrame=day';

  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return data;
  } else {
    throw Exception('Failed to generate meal plan');
  }
}
