import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class DetailPage extends StatelessWidget {
  final String title;
  final String content;
  final List<String> imageUrls;

  DetailPage({
    required this.title,
    required this.content,
    required this.imageUrls,
  });

  final FlutterTts flutterTts = FlutterTts();

  Future<void> _speak(String text) async {
    await flutterTts.setLanguage("th-TH"); // ตั้งค่าภาษาไทย
    await flutterTts.setSpeechRate(0.5); // ตั้งค่าความเร็วในการพูด
    await flutterTts.setVolume(1.0); // ระดับเสียง
    await flutterTts.setPitch(1.0); // โทนเสียง
    await flutterTts.speak(text); // เริ่มพูดข้อความ
  }

  Future<void> _stop() async {
    await flutterTts.stop(); // หยุดการพูด
  }

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
            // แสดงภาพใน PageView
            SizedBox(
              height: 200.0,
              child: PageView.builder(
                itemCount: imageUrls.length,
                itemBuilder: (context, index) {
                  return Image.network(
                    imageUrls[index],
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            // ปุ่มลำโพงสำหรับ TTS
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(Icons.volume_up),
                    color: Colors.green,
                    onPressed: () {
                      _speak(content); // เรียกใช้งาน TTS
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.stop),
                    color: Colors.red,
                    onPressed: () {
                      _stop(); // หยุดการพูด
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
