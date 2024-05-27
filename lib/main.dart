import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Login.dart';
import 'Detailpage.dart';

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

  void _searchFunction() {
    print('ค้นหา...');
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _navigateToLogin() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  void _navigateToDetailPage(BuildContext context, String title, String content, List<String> imagePaths) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(title: title, content: content, imagePaths: imagePaths),
      ),
    );
  }

  Widget buildCard(BuildContext context, String text, String title, String content, List<String> imagePaths) {
    return SizedBox(
      width: 150,
      height: 100,
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: InkWell(
          onTap: () {
            _navigateToDetailPage(context, title, content, imagePaths);
          },
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.all(20.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/LOGO.png'),
                radius: 100,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    // ใส่ข้อมูลสวนสมุนไพร
                    buildCard(
                      context, 
                      'สวนสมุนไพร\nMedicinal Plant Garden', 
                      'สวนสมุนไพร', 
                      'สวนสมุนไพรเป็นที่รวมสมุนไพรหลากหลายชนิดที่ใช้ในการแพทย์แผนไทย...',
                      ['assets/medicinal_plant1.jpg', 'assets/medicinal_plant2.jpg']
                    ),
                    SizedBox(height: 10),
                    // ใส่ข้อมูลอุทยานไม้ดอก
                    buildCard(
                      context, 
                      'อุทยานไม้ดอก\nForistic Garden', 
                      'อุทยานไม้ดอก', 
                      'อุทยานไม้ดอกประกอบไปด้วยพรรณไม้ดอกหลากสีสัน...',
                      ['assets/foristic_garden1.jpg', 'assets/foristic_garden2.jpg']
                    ),
                    SizedBox(height: 10),
                    // ใส่ข้อมูลลานวัฒนธรรม
                    buildCard(
                      context, 
                      'ลานวัฒนธรรม\nHome Garden of Ethnic Groups', 
                      'ลานวัฒนธรรม', 
                      'ลานวัฒนธรรมแสดงถึงความหลากหลายของชนเผ่า...',
                      ['assets/ethnic_garden1.jpg', 'assets/ethnic_garden2.jpg']
                    ),
                    SizedBox(height: 10),
                    // ใส่ข้อมูลสวนสน
                    buildCard(
                      context, 
                      'สวนสน\nPine garden', 
                      'สวนสน', 
                      'สวนสนมีต้นสนหลายสายพันธุ์ที่เจริญเติบโตในพื้นที่...',
                      ['assets/pine_garden1.jpg', 'assets/pine_garden2.jpg']
                    ),
                    SizedBox(height: 10),
                    // ใส่ข้อมูลสวนวัลยชาติ
                    buildCard(
                      context, 
                      'สวนวัลยชาติ\nClimber Garden', 
                      'สวนวัลยชาติ', 
                      'สวนวัลยชาติประกอบด้วยพรรณไม้เลื้อยหลากหลายชนิด...',
                      ['assets/climber_garden1.jpg', 'assets/climber_garden2.jpg']
                    ),
                  ],
                ),
                Column(
                  children: [
                    // ใส่ข้อมูลสวนวิวัฒนาการ
                    buildCard(
                      context, 
                      'สวนวิวัฒนาการ\nEvolution Garden', 
                      'สวนวิวัฒนาการ', 
                      'สวนวิวัฒนาการแสดงถึงการเปลี่ยนแปลงของพรรณไม้...',
                      ['assets/evolution_garden1.jpg', 'assets/evolution_garden2.jpg']
                    ),
                    SizedBox(height: 10),
                    // ใส่ข้อมูลสวนพุทธพฤกษ์
                    buildCard(
                      context, 
                      'สวนพุทธพฤกษ์\nBhuddist Plant Garden', 
                      'สวนพุทธพฤกษ์', 
                      'สวนพุทธพฤกษ์เป็นที่รวมพรรณไม้ที่เกี่ยวข้องกับศาสนาพุทธ...',
                      ['assets/bhuddist_garden1.jpg', 'assets/bhuddist_garden2.jpg']
                    ),
                    SizedBox(height: 10),
                    // ใส่ข้อมูลสวนพรรณไม้หายาก
                    buildCard(
                      context, 
                      'สวนพรรณไม้หายาก\nRare Plant Garden', 
                      'สวนพรรณไม้หายาก', 
                      'สวนพรรณไม้หายากประกอบด้วยพรรณไม้ที่ใกล้สูญพันธุ์...',
                      ['assets/rare_plant_garden1.jpg', 'assets/rare_plant_garden2.jpg']
                    ),
                    SizedBox(height: 10),
                    // ใส่ข้อมูลสวนเบญจพฤกษ์
                    buildCard(
                      context, 
                      'สวนเบญจพฤกษ์\nBanana Bamboo Lotus Orchid and Giger Collection', 
                      'สวนเบญจพฤกษ์', 
                      'สวนเบญจพฤกษ์รวบรวมพรรณไม้ที่สำคัญในวัฒนธรรมไทย...',
                      ['assets/bananas_collection1.jpg', 'assets/bananas_collection2.jpg']
                    ),
                    SizedBox(height: 10),
                    // ใส่ข้อมูลสวนซากุระ
                    buildCard(
                      context, 
                      'สวนซากุระ\nSakura garden', 
                      'สวนซากุระ', 
                      'สวนซากุระมีต้นซากุระที่ผลิดอกในช่วงฤดูใบไม้ผลิ...',
                      ['assets/sakura_garden1.jpg', 'assets/sakura_garden2.jpg']
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () => showImagePopup(context, 'assets/Map.png'),
              child: Container(
                alignment: Alignment.topCenter,
                child: Image.asset('assets/Map.png', fit: BoxFit.cover),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    // ใส่ข้อมูลสวนสมุนไพร
                    buildCard(
                      context, 
                      'สวนสมุนไพร\nMedicinal Plant Garden', 
                      'สวนสมุนไพร', 
                      'สวนสมุนไพรเป็นที่รวมสมุนไพรหลากหลายชนิดที่ใช้ในการแพทย์แผนไทย...',
                      ['assets/medicinal_plant1.jpg', 'assets/medicinal_plant2.jpg']
                    ),
                    SizedBox(height: 10),
                    // ใส่ข้อมูลอุทยานไม้ดอก
                    buildCard(
                      context, 
                      'อุทยานไม้ดอก\nForistic Garden', 
                      'อุทยานไม้ดอก', 
                      'อุทยานไม้ดอกประกอบไปด้วยพรรณไม้ดอกหลากสีสัน...',
                      ['assets/foristic_garden1.jpg', 'assets/foristic_garden2.jpg']
                    ),
                    SizedBox(height: 10),
                    // ใส่ข้อมูลลานวัฒนธรรม
                    buildCard(
                      context, 
                      'ลานวัฒนธรรม\nHome Garden of Ethnic Groups', 
                      'ลานวัฒนธรรม', 
                      'ลานวัฒนธรรมแสดงถึงความหลากหลายของชนเผ่า...',
                      ['assets/ethnic_garden1.jpg', 'assets/ethnic_garden2.jpg']
                    ),
                    SizedBox(height: 10),
                    // ใส่ข้อมูลสวนสน
                    buildCard(
                      context, 
                      'สวนสน\nPine garden', 
                      'สวนสน', 
                      'สวนสนมีต้นสนหลายสายพันธุ์ที่เจริญเติบโตในพื้นที่...',
                      ['assets/pine_garden1.jpg', 'assets/pine_garden2.jpg']
                    ),
                    SizedBox(height: 10),
                    // ใส่ข้อมูลสวนวัลยชาติ
                    buildCard(
                      context, 
                      'สวนวัลยชาติ\nClimber Garden', 
                      'สวนวัลยชาติ', 
                      'สวนวัลยชาติประกอบด้วยพรรณไม้เลื้อยหลากหลายชนิด...',
                      ['assets/climber_garden1.jpg', 'assets/climber_garden2.jpg']
                    ),
                  ],
                ),
                Column(
                  children: [
                    // ใส่ข้อมูลสวนวิวัฒนาการ
                    buildCard(
                      context, 
                      'สวนวิวัฒนาการ\nEvolution Garden', 
                      'สวนวิวัฒนาการ', 
                      'สวนวิวัฒนาการแสดงถึงการเปลี่ยนแปลงของพรรณไม้...',
                      ['assets/evolution_garden1.jpg', 'assets/evolution_garden2.jpg']
                    ),
                    SizedBox(height: 10),
                    // ใส่ข้อมูลสวนพุทธพฤกษ์
                    buildCard(
                      context, 
                      'สวนพุทธพฤกษ์\nBhuddist Plant Garden', 
                      'สวนพุทธพฤกษ์', 
                      'สวนพุทธพฤกษ์เป็นที่รวมพรรณไม้ที่เกี่ยวข้องกับศาสนาพุทธ...',
                      ['assets/bhuddist_garden1.jpg', 'assets/bhuddist_garden2.jpg']
                    ),
                    SizedBox(height: 10),
                    // ใส่ข้อมูลสวนพรรณไม้หายาก
                    buildCard(
                      context, 
                      'สวนพรรณไม้หายาก\nRare Plant Garden', 
                      'สวนพรรณไม้หายาก', 
                      'สวนพรรณไม้หายากประกอบด้วยพรรณไม้ที่ใกล้สูญพันธุ์...',
                      ['assets/rare_plant_garden1.jpg', 'assets/rare_plant_garden2.jpg']
                    ),
                    SizedBox(height: 10),
                    // ใส่ข้อมูลสวนเบญจพฤกษ์
                    buildCard(
                      context, 
                      'สวนเบญจพฤกษ์\nBanana Bamboo Lotus Orchid and Giger Collection', 
                      'สวนเบญจพฤกษ์', 
                      'สวนเบญจพฤกษ์รวบรวมพรรณไม้ที่สำคัญในวัฒนธรรมไทย...',
                      ['assets/bananas_collection1.jpg', 'assets/bananas_collection2.jpg']
                    ),
                    SizedBox(height: 10),
                    // ใส่ข้อมูลสวนซากุระ
                    buildCard(
                      context, 
                      'สวนซากุระ\nSakura garden', 
                      'สวนซากุระ', 
                      'สวนซากุระมีต้นซากุระที่ผลิดอกในช่วงฤดูใบไม้ผลิ...',
                      ['assets/sakura_garden1.jpg', 'assets/sakura_garden2.jpg']
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/LOGO.png'),
              radius: 100,
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: 'ค้นหา...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                filled: true,
                fillColor: Colors.white.withOpacity(0.5),
                prefixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _searchFunction,
              child: Text('ค้นหา'),
            ),
          ],
        ),
      ),
      GestureDetector(
        onTap: () async {
          const url = 'https://www.example.com';
          if (await canLaunch(url)) {
            await launch(url);
          } else {
            throw 'Could not launch $url';
          }
        },
        child: Container(
          alignment: Alignment.center,
          child: Text(
            'Visit Example.com',
            style: TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Navigation Bar Example'),
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/LOGO.png'),
        ),
        actions: [
          TextButton(
            onPressed: _navigateToLogin,
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