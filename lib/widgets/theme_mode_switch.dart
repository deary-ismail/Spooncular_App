// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:mobile_application_project/translations/locale_keys.dart';
// import 'package:mobile_application_project/widgets/app_text_english.dart';
// import 'package:mobile_application_project/widgets/theme.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../main.dart';

// class ThemeModeSwitch extends StatefulWidget {
//   @override
//   _ThemeModeSwitchState createState() => _ThemeModeSwitchState();
// }

// class _ThemeModeSwitchState extends State<ThemeModeSwitch> {
//   bool _isDarkMode = false;
//   Future<void> _toggleDarkMode(bool value) async {
//     final prefs = await SharedPreferences.getInstance();
//     prefs.setBool('isDarkMode', value);
//   }

//   Future<bool> _getDarkMode() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getBool('isDarkMode') ?? false;
//   }

//   @override
//   void initState() {
//     super.initState();
//     _getDarkMode().then((value) {
//       setState(() {
//         _isDarkMode = value;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SwitchListTile(
//         title: AppTextEnglish(
//           text: LocaleKeys.dark_mode.tr(),
//           size: 20.0,
//         ),
//         value: _isDarkMode,
//         onChanged: (value) {
//           setState(() {
//             _isDarkMode = value;
//             final theme = value ? darkTheme : lightTheme;
//             Provider.of<ThemeModel>(context, listen: false).setTheme(theme);
//             _toggleDarkMode(value);
//           });
//         });
//   }
// }

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobile_application_project/translations/locale_keys.dart';
import 'package:mobile_application_project/widgets/app_text_english.dart';
import 'package:mobile_application_project/widgets/theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';

class ThemeModeSwitch extends StatefulWidget {
  @override
  _ThemeModeSwitchState createState() => _ThemeModeSwitchState();
}

class _ThemeModeSwitchState extends State<ThemeModeSwitch> {
  bool _isDarkMode = false;

  Future<void> _toggleDarkMode(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', value);
  }

  Future<bool> _getDarkMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isDarkMode') ?? false;
  }

  @override
  void initState() {
    super.initState();
    _getDarkMode().then((value) {
      setState(() {
        _isDarkMode = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: AppTextEnglish(
        text: LocaleKeys.dark_mode.tr(),
        size: 20.0,
      ),
      value: _isDarkMode,
      onChanged: (value) {
        setState(() {
          _isDarkMode = value;
          final theme = value ? darkTheme : lightTheme;
          Provider.of<ThemeModel>(context, listen: false).setTheme(theme);
          _toggleDarkMode(value);
        });
      },
    );
  }
}
