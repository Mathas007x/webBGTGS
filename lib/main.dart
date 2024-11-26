import 'package:flutter/material.dart';
import 'Login.dart';
import 'search_page.dart';
import 'home_page.dart';
import 'map_page.dart';
import 'app_bar.dart';
import 'bottom_nav_bar.dart';
import 'external_link.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'สวนพฤกษศาสตร์มหาวิทยาลัยแม่ฟ้าหลวง',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

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
    List<Widget> widgetOptions = <Widget>[
      HomePage(), // หน้า HomePage
      MapPage(), // หน้าแผนที่
      SearchPage(), // หน้า Search
      ExternalLink(), // ลิงก์ภายนอก
    ];

    return Scaffold(
      appBar: buildAppBar(context, _navigateToLogin),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/BG.jpg"), // พื้นหลังแอปทั้งหมด
            fit: BoxFit.cover,
          ),
        ),
        child: widgetOptions.elementAt(_selectedIndex), // โหลดหน้าแต่ละหน้าตามที่เลือก
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  void _navigateToLogin() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }
}
