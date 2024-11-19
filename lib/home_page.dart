import 'package:flutter/material.dart';
import 'DetailPage.dart';
import 'strapi_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
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
            _navigateToDetailPage(context, garden);
          },
          child: Center(
            child: Text(
              garden.title,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return gardens.isEmpty
        ? Center(child: CircularProgressIndicator())
        : SingleChildScrollView(
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
                      children: gardens.map((garden) {
                        return Column(
                          children: [
                            buildCard(
                              context,
                              garden,
                            ),
                            SizedBox(height: 10),
                          ],
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ],
            ),
          );
  }
}
