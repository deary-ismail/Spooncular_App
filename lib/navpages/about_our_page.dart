import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mobile_application_project/widgets/app_text_english.dart';

import '../../misc/colors.dart';
import '../../widgets/AppBar_page.dart';
import '../translations/locale_keys.dart';

class AboutOurPage extends StatelessWidget {
  const AboutOurPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBarPage(
          text: LocaleKeys.about_us.tr(),
        ),
        preferredSize: Size.fromHeight(110),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(20),
        children: [
          Expanded(
            child: CircleAvatar(
              backgroundImage: AssetImage('images/deary.jpg'),
              radius: 180,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          AppTextEnglish(
            size: 18,
            text: LocaleKeys.deary.tr(),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: CircleAvatar(
              backgroundImage: AssetImage('images/saman.jpg'),
              radius: 180,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          AppTextEnglish(
            size: 18,
            text: LocaleKeys.saman.tr(),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: CircleAvatar(
              backgroundImage: AssetImage('images/muhamad.jpg'),
              radius: 180,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          AppTextEnglish(
            size: 18,
            text: LocaleKeys.muhamad.tr(),
          )
        ],
      ),
    );
  }
}
