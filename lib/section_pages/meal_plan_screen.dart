import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobile_application_project/misc/colors.dart';

import '../api/meal_plan_api.dart';
import '../translations/locale_keys.dart';
import '../widgets/AppBar_page.dart';

class MealPlanScreen extends StatefulWidget {
  @override
  _MealPlanScreenState createState() => _MealPlanScreenState();
}

class _MealPlanScreenState extends State<MealPlanScreen> {
  late Map<String, dynamic> _mealPlan;

  @override
  void initState() {
    super.initState();
    _fetchMealPlan();
  }

  Future<void> _fetchMealPlan() async {
    final mealPlan = await generateMealPlan();
    setState(() {
      _mealPlan = mealPlan;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBarPage(text: LocaleKeys.meal_plan.tr()),
        preferredSize: Size.fromHeight(110),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20.0, left: 8.0),
        child: _mealPlan == null
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _mealPlan['meals'].length,
                itemBuilder: (context, index) {
                  final meal = _mealPlan['meals'][index];
                  return Container(
                    margin: EdgeInsets.only(top: 25.0),
                    child: ListTile(
                      title: Text(meal['title']),
                      subtitle: Text(
                        meal['sourceUrl'],
                        style: TextStyle(color: AppColors.textColor1),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
