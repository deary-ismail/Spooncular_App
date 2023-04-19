import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mobile_application_project/misc/colors.dart';
import 'package:mobile_application_project/translations/locale_keys.dart';
import 'package:mobile_application_project/widgets/AppBar_page.dart';
import 'package:mobile_application_project/widgets/app_text_english.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/theme_mode_switch.dart';
import 'about_our_page.dart';
import 'about_page.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  String? dropdownValue;
  String hintText = LocaleKeys.choose.tr();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBarPage(text: LocaleKeys.setting_page.tr()),
        preferredSize: Size.fromHeight(110),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20.0,
          ),
          ThemeModeSwitch(),
          ListTile(
            title: AppTextEnglish(
              text: LocaleKeys.language.tr(),
              size: 20.0,
            ),
            trailing: Container(
              width: 120.0,
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: 4, color: AppColors.main2ndColor)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  hint: AppTextEnglish(
                    text: hintText,
                    size: 15,
                  ),
                  value: dropdownValue,
                  onChanged: (String? newValue) {
                    setState(() async {
                      dropdownValue = newValue!;
                      if (newValue == 'English') {
                        await context.setLocale(Locale('en'));
                      } else if (newValue == 'Arabic') {
                        await context.setLocale(Locale('ar'));
                      }
                    });
                  },
                  items: <String>[
                    'English',
                    'Arabic',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          const Divider(
            color: Colors.black54,
            height: 30.0,
          ),
          ListTile(
            trailing: const Icon(Icons.info),
            title: AppTextEnglish(
              text: LocaleKeys.about_app.tr(),
              size: 20,
            ),
            onTap: () {
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
}
