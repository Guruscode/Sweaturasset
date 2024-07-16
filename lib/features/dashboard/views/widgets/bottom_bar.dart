import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swa/constants/colors.dart';
import 'package:swa/features/dashboard/views/pages/calculator_page.dart';
import 'package:swa/features/dashboard/views/pages/home_page.dart';
import 'package:swa/features/dashboard/views/pages/resources_page.dart';
import 'package:swa/features/dashboard/views/pages/settings_page.dart';

class AppBottomBar extends StatefulWidget {
  const AppBottomBar({super.key});

  @override
  State<AppBottomBar> createState() => _AppBottomBarState();
}

class _AppBottomBarState extends State<AppBottomBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const HomePage(),
    const ResourcesPage(),
    const CalculatorPage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: blueColor,
        unselectedItemColor: Colors.black,
        elevation: 0,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/home.png',
              height: 30.h,
              color: _selectedIndex == 0 ? blueColor : Colors.grey.shade800,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/book.png',
              height: 30.h,
              color: _selectedIndex == 1 ? blueColor : Colors.grey.shade800,
            ),
            label: 'Resources',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/calculator.png',
              height: 30.h,
              color: _selectedIndex == 2 ? blueColor : Colors.grey.shade800,
            ),
            label: 'Calculator',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/setting.png',
              height: 30.h,
              color: _selectedIndex == 3 ? blueColor : Colors.grey.shade800,
            ),
            label: 'Setting',
          ),
        ],
      ),
      body: _pages[_selectedIndex],
    );
  }
}
