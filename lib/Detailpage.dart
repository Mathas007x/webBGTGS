import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class DetailPage extends StatelessWidget {
  final String title;
  final String content;
  final List<String> imageUrls;

  final FlutterTts flutterTts = FlutterTts();

  DetailPage({required this.title, required this.content, required this.imageUrls});

  Future<void> _speak(String text) async {
    await flutterTts.setLanguage("th-TH");
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.speak(text);
  }

  Future<void> _stop() async => await flutterTts.stop();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), backgroundColor: Colors.green),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
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
                children: [
                  IconButton(
                    icon: Icon(Icons.volume_up),
                    color: Colors.green,
                    onPressed: () => _speak(content),
                  ),
                  IconButton(
                    icon: Icon(Icons.stop),
                    color: Colors.red,
                    onPressed: _stop,
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
