import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mobile_application_project/widgets/app_text_kurdish.dart';
import '../misc/colors.dart';
import 'appBar_text_english.dart';
import 'app_text_english.dart';

class AppBarPage extends StatelessWidget {
  final String text;
  double raduis;
  AppBarPage({
    Key? key,
    this.raduis = 200.0,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
        color: Colors.black, // <-- SEE HERE
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(200),
              bottomRight: Radius.circular(200))),
      title: AppBarTextEnglish(
        text: text,
        color: Colors.black,
      ),
      centerTitle: true,
      elevation: 20,
      flexibleSpace: ClipRRect(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(raduis)),
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
    );
  }
}
