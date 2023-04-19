import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobile_application_project/model/similar_recipe_model.dart';
import '../api/similar_recipes_api.dart';
import '../translations/locale_keys.dart';
import '../widgets/AppBar_page.dart';

class SimilarRecipesScreen extends StatelessWidget {
  final int recipeId;

  const SimilarRecipesScreen({Key? key, required this.recipeId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBarPage(text: LocaleKeys.similar_recipe.tr()),
        preferredSize: Size.fromHeight(110),
      ),
      body: FutureBuilder<List<SimilarRecipeModel>>(
        future: getSimilarRecipes(recipeId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final recipes = snapshot.data!;
            return ListView.builder(
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                final recipe = recipes[index];
                return ListTile(
                  title: Text(recipe.title),
                  subtitle: Text('Servings: ${recipe.servings}'),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
