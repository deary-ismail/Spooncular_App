import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mobile_application_project/navpages/search_page.dart';
import 'package:mobile_application_project/navpages/setting_page.dart';
import 'package:mobile_application_project/section_pages/meal_plan_screen.dart';
import 'package:mobile_application_project/widgets/app_text_english.dart';
import 'package:mobile_application_project/widgets/search_details.dart';
import '../misc/colors.dart';
import '../section_pages/similar_recipes_screen.dart';
import '../section_pages/trivia_screen.dart';
import '../translations/locale_keys.dart';
import '../widgets/AppBar_page.dart';
import 'home_page.dart';
import 'main_page.dart';

class SectionPage extends StatelessWidget {
  const SectionPage({super.key});

  MaterialStateProperty<Color> getColor(Color color, Color colorPressed) {
    final getColor = (Set<MaterialState> state) {
      if (state.contains(MaterialState.pressed)) {
        return colorPressed;
      } else {
        return color;
      }
    };
    return MaterialStateProperty.resolveWith(getColor);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBarPage(text: LocaleKeys.search_page.tr()),
        preferredSize: Size.fromHeight(110),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.all(8.0),
            child: AppTextEnglish(
              text: LocaleKeys.section_text.tr(),
              size: 20,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      getColor(AppColors.main2ndColor, Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SimilarRecipesScreen(
                            recipeId: 1,
                          )));
                },
                child: Text(LocaleKeys.similar_recipe.tr())),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      getColor(AppColors.main2ndColor, Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => MealPlanScreen()));
                },
                child: Text(LocaleKeys.meal_plan.tr())),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      getColor(AppColors.main2ndColor, Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => TriviaScreen()));
                },
                child: Text(LocaleKeys.trivia_page.tr())),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      getColor(AppColors.main2ndColor, Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => MainPage()));
                  Navigator.of(context).pop();
                },
                child: Text(LocaleKeys.home_page.tr())),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      getColor(AppColors.main2ndColor, Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => RecipeSearch()));
                },
                child: Text(LocaleKeys.search_page.tr())),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      getColor(AppColors.main2ndColor, Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SettingPage()));
                },
                child: Text(LocaleKeys.setting_page.tr())),
          ),
        ],
      ),
    );
  }
}
