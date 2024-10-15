import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String title;
  final String content;
  final List<String> imagePaths;

  DetailPage({required this.title, required this.content, required this.imagePaths});

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
                itemCount: imagePaths.length,
                itemBuilder: (context, index) {
                  return Image.asset(imagePaths[index], fit: BoxFit.cover);
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
                      // เพิ่มฟังก์ชันที่คุณต้องการเมื่อกดปุ่มลำโพง
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
