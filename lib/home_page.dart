import 'package:flutter/material.dart';
import 'DetailPage.dart';
import 'strapi_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final StrapiService strapiService = StrapiService();

  @override
  void initState() {
    super.initState();

    // ใช้ addPostFrameCallback เพื่อเรียก API หลังจากที่ Widget ถูกสร้างเสร็จแล้ว
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchGardens();
    });
  }

  Future<List<Garden>> _fetchGardens() async {
    return await strapiService.fetchGardens();
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

  Widget buildGardenCard(BuildContext context, Garden garden) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
        onTap: () => _navigateToDetailPage(context, garden),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: garden.imageUrls.isNotEmpty
                  ? ClipRRect(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(10.0)),
                      child: Image.network(
                        garden.imageUrls[0],
                        fit: BoxFit.cover,
                        width: double.infinity,
                        errorBuilder: (context, error, stackTrace) => Icon(
                          Icons.broken_image,
                          size: 50,
                        ),
                      ),
                    )
                  : Container(
                      color: Colors.grey[300],
                      child: Icon(Icons.image_not_supported, size: 50),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                garden.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Home', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: FutureBuilder<List<Garden>>(
          future: _fetchGardens(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator()); // Loading state
            } else if (snapshot.hasError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Failed to load gardens. Please try again.',
                      style: TextStyle(fontSize: 16, color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {}); // รีเฟรชหน้าจอเพื่อเรียก API ใหม่
                      },
                      child: Text('Retry'),
                    ),
                  ],
                ),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No gardens found.'));
            } else {
              final gardens = snapshot.data!;
              double screenWidth = MediaQuery.of(context).size.width;
              int crossAxisCount = (screenWidth / 200).floor();

              return SingleChildScrollView(
                child: Column(
                  children: [
                    // LOGO Section
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/LOGO.png'),
                        radius: 100,
                      ),
                    ),
                    // Grid Section
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                          return buildGardenCard(context, gardens[index]);
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
