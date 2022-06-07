import 'package:flutter/material.dart';
import 'package:s1_lab/calendar_page.dart';
import 'package:s1_lab/history_page.dart';
import 'package:s1_lab/login_page.dart';
import 'package:s1_lab/setting_page.dart';

class TabPage extends StatefulWidget {
  const TabPage({Key? key}) : super(key: key);

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int _selectedIndex = 0;
  List _pages = [
    HistoryPage(),
    CalendarPage(),
    SettingPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Center(child: _pages[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
          onTap: _onItemTapped,
            currentIndex: _selectedIndex,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: '내역'),
              BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: '달력'),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: '설정')
      ]),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

