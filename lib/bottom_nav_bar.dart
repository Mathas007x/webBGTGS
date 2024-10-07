import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  BottomNavBar({required this.selectedIndex, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'หน้าแรก',
          backgroundColor: Colors.green,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: 'MAP',
          backgroundColor: Colors.green,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'search',
          backgroundColor: Colors.green,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.web),
          label: 'FacebookMFU',
          backgroundColor: Colors.green,
        ),
      ],
      currentIndex: selectedIndex,
      unselectedLabelStyle: TextStyle(color: Colors.black),
      selectedLabelStyle: TextStyle(color: Colors.white),
      unselectedItemColor: Colors.black,
      selectedItemColor: Colors.white,
      onTap: onItemTapped,
    );
  }
}
