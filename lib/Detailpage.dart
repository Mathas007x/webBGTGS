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
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/BG.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
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
                child: Text(
                  content,
                  style: TextStyle(color: Colors.white), // Set the text color to white for better contrast
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}