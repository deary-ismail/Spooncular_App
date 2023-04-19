import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobile_application_project/translations/codegen_loader.g.dart';
import 'package:mobile_application_project/widgets/theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'navpages/main_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeModel()),
        // other providers
      ],
      child: EasyLocalization(
          path: 'assets/translations',
          supportedLocales: [Locale('en'), Locale('ar')],
          fallbackLocale: Locale('en'),
          assetLoader: CodegenLoader(),
          child: MyApp()),
    ),
  );
}

class ThemeModel with ChangeNotifier {
  ThemeData _themeData = lightTheme;

  ThemeData getTheme() => _themeData;

  void setTheme(ThemeData theme) {
    _themeData = theme;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context).getTheme();
    return MaterialApp(
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      title: 'My App',
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: MainPage(),
    );
  }
}
