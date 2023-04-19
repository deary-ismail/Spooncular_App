import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mobile_application_project/navpages/search_page.dart';
import 'package:mobile_application_project/navpages/section_page.dart';
import 'package:mobile_application_project/navpages/setting_page.dart';
import 'package:mobile_application_project/widgets/AppBar_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_application_project/widgets/app_text_kurdish.dart';
import '../misc/colors.dart';
import '../section_pages/meal_plan_screen.dart';
import '../section_pages/similar_recipes_screen.dart';
import '../section_pages/trivia_screen.dart';
import '../services/spoonacular_api.dart';
import '../translations/locale_keys.dart';
import '../widgets/RecipeDetailsScreen.dart';
import '../widgets/appBar_text_english.dart';
import '../widgets/app_text_english.dart';
import 'about_our_page.dart';
import 'about_page.dart';
import 'main_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> _recipes = [];
  late final futurePrice;
  @override
  void initState() {
    super.initState();
    _getRecipes();
  }

  Future<void> _getRecipes() async {
    final response = await SpoonacularApi.getRecipes(10);
    final data = jsonDecode(response.body);
    setState(() {
      _recipes = data['recipes'];
    });
  }

  void _openRecipeDetailsScreen(dynamic recipe) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RecipeDetailsScreen(recipe: recipe),
      ),
    );
  }

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
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: Icon(Icons.menu),
            color: Colors.black,
            iconSize: 30.0,
          );
        }),
        actions: [
          IconButton(
            onPressed: (() {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RecipeSearch()));
            }),
            icon: Icon(Icons.search),
            color: Colors.black,
            iconSize: 30.0,
          )
        ],
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(200),
                bottomRight: Radius.circular(200))),
        title: AppBarTextEnglish(
          text: LocaleKeys.home_page.tr(),
        ),
        centerTitle: true,
        elevation: 20,
        flexibleSpace: ClipRRect(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(200)),
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [AppColors.main2ndColor, Colors.white],
                    begin: Alignment.bottomLeft,
                    end: Alignment.bottomRight)),
          ),
        ),
        bottom: PreferredSize(
            child: Container(), preferredSize: const Size.fromHeight(55)),
      ),
      drawer: Container(
        color: Colors.black,
        child: NavigationDrawer(),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AppTextEnglish(
                text: LocaleKeys.sections.tr(),
                color: Colors.black,
              ),
              SizedBox(
                width: 150,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        getColor(AppColors.main2ndColor, Colors.white),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SectionPage()));
                  },
                  child: Text(LocaleKeys.show_all.tr()))
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.all(8.0),
            height: 30,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ElevatedButton(
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
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          getColor(AppColors.main2ndColor, Colors.white),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MealPlanScreen()));
                    },
                    child: Text(LocaleKeys.meal_plan.tr())),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          getColor(AppColors.main2ndColor, Colors.white),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => TriviaScreen()));
                    },
                    child: Text(LocaleKeys.trivia_page.tr())),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.all(5.0),
            child: AppTextEnglish(
              text: LocaleKeys.recipes_randomly.tr(),
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 300,
            child: ListView(
              children: [
                for (final recipe in _recipes)
                  GestureDetector(
                    onTap: () => _openRecipeDetailsScreen(recipe),
                    child: ListTile(
                      title: Text(recipe['title']),
                      subtitle: Text(recipe['sourceName']),
                      leading: Image.network(recipe['image']),
                    ),
                  ),
                // Add more widgets here
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildHeader(context),
              buildMenuItems(context),
            ],
          ),
        ),
      );
  Widget buildHeader(BuildContext context) => Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        color: AppColors.main2ndColor,
        child: Column(
          children: [
            CircleAvatar(
              radius: 62,
              backgroundImage: AssetImage('images/spoonacular.png'),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              LocaleKeys.drawer_text.tr(),
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 9,
            ),
          ],
        ),
      );
  Widget buildMenuItems(BuildContext context) => Container(
        padding: EdgeInsets.all(24),
        child: Wrap(
          runSpacing: 16,
          children: [
            ListTile(
              trailing: const Icon(Icons.home_outlined),
              title: AppTextEnglish(
                text: LocaleKeys.home_page.tr(),
                size: 20,
              ),
              onTap: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const MainPage())),
            ),
            ListTile(
              trailing: const Icon(Icons.search),
              title: AppTextEnglish(
                text: LocaleKeys.search_page.tr(),
                size: 20,
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => RecipeSearch()));
              },
            ),
            ListTile(
              trailing: const Icon(Icons.settings),
              title: AppTextEnglish(
                text: LocaleKeys.setting_page.tr(),
                size: 20,
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SettingPage()));
              },
            ),
            const Divider(
              color: Colors.black54,
            ),
            ListTile(
              trailing: const Icon(Icons.info),
              title: AppTextEnglish(
                text: LocaleKeys.about_app.tr(),
                size: 20,
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AboutProgramPage()));
              },
            ),
            ListTile(
              trailing: const Icon(Icons.contacts),
              title: AppTextEnglish(
                text: LocaleKeys.about_us.tr(),
                size: 20,
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AboutOurPage()));
              },
            ),
            ListTile(
              trailing: const Icon(Icons.logout),
              title: AppTextEnglish(
                text: LocaleKeys.exit.tr(),
                size: 20,
              ),
              onTap: () {
                SystemNavigator.pop();
              },
            ),
          ],
        ),
      );
}
