import 'package:flutter/material.dart';
import 'Login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom Navigation Bar',
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

  void _searchFunction() {
    // ใส่โค้ดสำหรับการค้นหาตามความต้องการ
    // ตัวอย่างเช่นค้นหาในฐานข้อมูล, เรียก API หรือการจัดการข้อมูลแบบอื่นๆ
    print('ค้นหา...');
  }

  void showImagePopup(BuildContext context, String imagePath) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: InteractiveViewer(
            boundaryMargin: EdgeInsets.all(20.0),
            minScale: 0.1,
            maxScale: 3.0,
            child: Image.asset(imagePath, fit: BoxFit.cover),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      Container(
        alignment: Alignment.center,
        child: Text(
          'หน้าแรก',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
      ),

      GestureDetector(
        onTap: () => showImagePopup(context, 'assets/Map.png'),
        child: Container(
          alignment: Alignment.topCenter,
          child: Image.asset('assets/Map.png', fit: BoxFit.cover),
        ),
      ), // แผนที่

      Container(
        ////หน้าค้นหา
        alignment: Alignment.center,
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ค้นหา',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: 'ค้นหา...',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _searchFunction();
              },
              child: Text('ค้นหา'),
            ),
          ],
        ),
      ),

      Container(
        alignment: Alignment.center,
        child: Text(
          'โปรไฟล์',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
      ),
    ];

    void _onItemTapped(int index) {
      //การกระทำต่อปุ่ม
      setState(() {
        _selectedIndex = index;
      });
    }

    void _navigateToLogin() {
      //เปลี่ยนหน้าLogin
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/Logo.jpg'),
        ),
        actions: [
          TextButton(
            // เปลี่ยนปุ่มเป็น TextButton
            onPressed: _navigateToLogin,
            child: Text(
              'Login',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
        backgroundColor: Colors.green, // ใส่สี
      ),
      body: Container(
        // ใส่ภาพพื้นหลัง
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/BG.jpg"), // ตำแหน่งภาพใน assets
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
            backgroundColor: Colors.green, // ใส่สี
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'MAP',
            backgroundColor: Colors.green, // ใส่สี
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'search',
            backgroundColor: Colors.green, // ใส่สี
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.web),
            label: 'FacebookMFU',
            backgroundColor: Colors.green, // ใส่สี
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedLabelStyle: TextStyle(color: Colors.black),
        selectedLabelStyle: TextStyle(color: Colors.white),
        unselectedItemColor: Colors.black, // สีของไอคอนที่ไม่ได้ถูกเลือก
        selectedItemColor: Colors.white, // สีของไอคอนที่ถูกเลือก
        onTap: _onItemTapped,
      ),
    );
  }
}
