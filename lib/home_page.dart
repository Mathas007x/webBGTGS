import 'package:flutter/material.dart';
import 'DetailPage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> gardens = [];

  @override
  void initState() {
    super.initState();
    _fetchGardens();
  }

  Future<void> _fetchGardens() async {
    final String baseUrl = dotenv.env['STRAPI_BASE_URL']!;
    final response = await http.get(Uri.parse('$baseUrl/api/blog'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        gardens = List<Map<String, dynamic>>.from(data['data'].map((item) {
          final attributes = item['attributes'];
          return {
            'title': attributes['title'],
            'content': attributes['content'],
            'images': List<String>.from(
              attributes['images']['data'].map((img) => img['attributes']['url']),
            ),
          };
        }));
      });
    } else {
      print('Failed to load gardens');
    }
  }

  void _navigateToDetailPage(BuildContext context, String title, String content, List<String> imageUrls) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(title: title, content: content, imageUrls: imageUrls),
      ),
    );
  }

  Widget buildCard(BuildContext context, String title, String content, List<String> imageUrls) {
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
            _navigateToDetailPage(context, title, content, imageUrls);
          },
          child: Center(
            child: Text(
              title,
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
                              garden['title'],
                              garden['content'],
                              garden['images'],
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
