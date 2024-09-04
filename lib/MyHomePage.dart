import 'package:flutter/material.dart';
import 'HomePageContent.dart';
import 'MapPage.dart';
import 'SearchPage.dart';
import 'WebViewPage.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      HomePageContent(),
      MapPage(),
      SearchPage(),
      WebViewPage(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Navigation Bar Example'),
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/LOGO.png'),
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Navigate to Login Page
            },
            child: Text(
              'Login',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
        backgroundColor: Colors.green,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/BG.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
        currentIndex: _selectedIndex,
        unselectedLabelStyle: TextStyle(color: Colors.black),
        selectedLabelStyle: TextStyle(color: Colors.white),
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
