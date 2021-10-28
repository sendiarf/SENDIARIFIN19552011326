import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:sendiarifin19552011326/dashboard_page.dart';
import 'package:sendiarifin19552011326/date_page.dart';
import 'package:sendiarifin19552011326/time_page.dart';


class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedindex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _selectedindex = index;
            });
          },
          children: [
            DashboardPage(),
            DatePage(),
            TimePage(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _selectedindex,
        onItemSelected: (index) {
          setState(() {
            _selectedindex = index;
          });
          _pageController.jumpToPage(index);
        },
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.dashboard),
            title: Text('Dashboard'),
            activeColor: Colors.blueAccent,
            inactiveColor: Colors.blueAccent,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.date_range),
            title: Text('Date'),
            activeColor: Colors.redAccent,
            inactiveColor: Colors.redAccent,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.timer),
            title: Text('Time'),
            activeColor: Colors.greenAccent,
            inactiveColor: Colors.greenAccent,
          ),
        ],
      ),
    );
  }
}
