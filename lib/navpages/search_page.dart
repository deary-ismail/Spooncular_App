import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:mobile_application_project/services/spoonacular_api.dart';
import 'package:flutter/material.dart';
import 'package:mobile_application_project/services/spoonacular_api.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_application_project/widgets/app_text_english.dart';

import '../translations/locale_keys.dart';
import '../widgets/AppBar_page.dart';
import '../widgets/search_details.dart';

class RecipeSearch extends StatefulWidget {
  @override
  _RecipeSearchState createState() => _RecipeSearchState();
}

class _RecipeSearchState extends State<RecipeSearch> {
  final _searchController = TextEditingController();
  List<dynamic> _recipes = [];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<List<dynamic>> getInformationRecipes(String query) async {
    var url = Uri.parse(
        'https://api.spoonacular.com/recipes/complexSearch?apiKey=6f1f97066dfd4414b1710984979febb2&query=$query');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return jsonResponse['results'];
    } else {
      throw Exception('Failed to load recipes');
    }
  }

  void _search() async {
    var query = _searchController.text;
    var recipes = await getInformationRecipes(query);
    setState(() {
      _recipes = recipes;
    });
  }

  void _viewRecipe(dynamic recipe) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchDetail(recipe: recipe),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBarPage(
          text: LocaleKeys.search_page.tr(),
        ),
        preferredSize: Size.fromHeight(110),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppTextEnglish(
              text: LocaleKeys.search_text.tr(),
              size: 20,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: LocaleKeys.search_recipe.tr(),
                border: OutlineInputBorder(),
              ),
              onSubmitted: (_) => _search(),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _recipes.length,
              itemBuilder: (context, index) {
                var recipe = _recipes[index];
                return InkWell(
                  onTap: () => _viewRecipe(recipe),
                  child: ListTile(
                    title: Text(recipe['title']),
                    subtitle: Text(LocaleKeys.search_detail_title.tr()),
                    leading: Image.network(recipe['image']),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
