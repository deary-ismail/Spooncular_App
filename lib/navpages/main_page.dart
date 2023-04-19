import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_application_project/navpages/search_page.dart';
import 'package:mobile_application_project/navpages/setting_page.dart';
import '../misc/colors.dart';
import 'home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    HomePage(),
    RecipeSearch(),
    SettingPage(),
  ];
  int currentIndex = 0;
  void onTab(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.main2ndColor,
        onTap: onTab,
        currentIndex: currentIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showUnselectedLabels: false,
        elevation: 0,
        items: [
          BottomNavigationBarItem(label: ("Home"), icon: Icon(Icons.apps)),
          BottomNavigationBarItem(label: ("Search"), icon: Icon(Icons.search)),
          BottomNavigationBarItem(
              label: ("Setting"), icon: Icon(Icons.settings)),
        ],
      ),
    );
  }
}
