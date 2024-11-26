import 'package:flutter/material.dart';
import 'DetailPage.dart';
import 'strapi_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // โปร่งใสเพื่อให้ BG จาก main.dart แสดง
      body: Center(
        child: Text(
          "Welcome to Home Page",
          style: TextStyle(fontSize: 24, color: Colors.white), // ข้อความตัวอย่าง
        ),
      ),
    );
  }
}

class _HomePageState extends State<HomePage> {
  List<Garden> gardens = [];
  final StrapiService strapiService = StrapiService();

  @override
  void initState() {
    super.initState();
    _fetchGardens();
  }

  Future<void> _fetchGardens() async {
    try {
      final fetchedGardens = await strapiService.fetchGardens();
      setState(() {
        gardens = fetchedGardens;
      });
    } catch (e) {
      print('Failed to load gardens: $e');
    }
  }

  void _navigateToDetailPage(BuildContext context, Garden garden) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(
          title: garden.title,
          content: garden.description,
          imageUrls: garden.imageUrls,
        ),
      ),
    );
  }

  Widget buildCard(BuildContext context, Garden garden) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
        onTap: () {
          _navigateToDetailPage(context, garden);
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                garden.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = (screenWidth / 200).floor();

    return Scaffold(
      backgroundColor: Colors.transparent, // ทำให้พื้นหลังโปร่งใส
      appBar: AppBar(
        backgroundColor: Colors.transparent, // โปร่งใสใน AppBar ด้วย
        elevation: 0,
      ),
      body: gardens.isEmpty
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  // LOGO Section
                  Container(
                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.all(20.0),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/LOGO.png'),
                      radius: 100,
                    ),
                  ),
                  // Grid Section
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 3 / 2,
                      ),
                      itemCount: gardens.length,
                      itemBuilder: (context, index) {
                        return buildCard(context, gardens[index]);
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
