import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final iconList = <IconData>[
    Icons.home,
    Icons.search,
    Icons.message,
    Icons.person,
  ];

  final pages = [
    Center(child: Icon(Icons.home_outlined, size: 200, color: Colors.orange)),
    Center(child: Icon(Icons.search_outlined, size: 200, color: Colors.orange)),
    Center(
      child: Icon(Icons.message_outlined, size: 200, color: Colors.orange),
    ),
    Center(
      child: Icon(Icons.person_2_outlined, size: 200, color: Colors.orange),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Stack(
          children: [
            Text(
              'APLIKASI KU',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 35,
                fontWeight: FontWeight.bold,
                foreground:
                    Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 6
                      ..color = Colors.orange,
              ),
            ),
            Text(
              'APLIKASI KU',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),

      body: pages[_currentIndex],
      floatingActionButton: Container(
        width: 70,
        height: 70,
        child: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add, size: 32),
          backgroundColor: Colors.orange,
          shape: CircleBorder(),
          elevation: 8,
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeIndex: _currentIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index) => setState(() => _currentIndex = index),
        backgroundColor: Colors.white,
        activeColor: Colors.orange,
        inactiveColor: Colors.grey,
      ),
    );
  }
}
