import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mobile_application_project/widgets/app_text_english.dart';
import '../../misc/colors.dart';
import '../../widgets/AppBar_page.dart';
import '../translations/locale_keys.dart';

class AboutProgramPage extends StatelessWidget {
  const AboutProgramPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBarPage(
          text: LocaleKeys.about_app.tr(),
        ),
        preferredSize: Size.fromHeight(110),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(20),
        children: [
          Expanded(
            child: CircleAvatar(
              backgroundImage: AssetImage('images/spoonacular.png'),
              radius: 180,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          AppTextEnglish(size: 20, text: LocaleKeys.about_app_text.tr()),
          Divider(
            color: Colors.black54,
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppTextEnglish(
                text: LocaleKeys.copyRight.tr(),
                size: 20,
              ),
              Icon(Icons.copyright),
              AppTextEnglish(
                text: LocaleKeys.DSM_team.tr(),
                size: 20.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
