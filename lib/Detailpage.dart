import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String title;
  final String content;
  final List<String> imageUrls;

  DetailPage({required this.title, required this.content, required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200.0,
              child: PageView.builder(
                itemCount: imageUrls.length,
                itemBuilder: (context, index) {
                  return Image.network(imageUrls[index], fit: BoxFit.cover);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(Icons.volume_up),
                    color: Colors.green,
                    onPressed: () {
                      print('Speaker button pressed!');
                    },
                  ),
                  Expanded(
                    child: Text(
                      content,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
