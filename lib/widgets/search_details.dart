import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobile_application_project/translations/locale_keys.dart';
import 'AppBar_page.dart';

class SearchDetail extends StatelessWidget {
  final dynamic recipe;

  const SearchDetail({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBarPage(
          text: recipe['title'],
          raduis: 0.0,
        ),
        preferredSize: Size.fromHeight(110),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              // padding: const EdgeInsets.all(5.0),
              child: Image.network(recipe['image']),
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                recipe['title'],
                style: TextStyle(fontSize: 30),
              ),
            ),
            SizedBox(height: 8),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  LocaleKeys.search_detail.tr(),
                  textAlign: TextAlign.justify,
                )),
          ],
        ),
      ),
    );
  }
}
