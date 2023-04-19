import 'package:flutter/material.dart';
import 'package:mobile_application_project/misc/colors.dart';
import 'AppBar_page.dart';

class RecipeDetailsScreen extends StatelessWidget {
  final dynamic recipe;

  RecipeDetailsScreen({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBarPage(
          text: recipe['title'],
          raduis: 0,
        ),
        preferredSize: Size.fromHeight(110),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(recipe['image']),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                recipe['title'],
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                recipe['instructions'],
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
