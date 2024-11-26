import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeechButton extends StatefulWidget {
  final String textToSpeak; // ข้อความที่ต้องการให้ TTS อ่าน

  const TextToSpeechButton({Key? key, required this.textToSpeak}) : super(key: key);

  @override
  _TextToSpeechButtonState createState() => _TextToSpeechButtonState();
}

class _TextToSpeechButtonState extends State<TextToSpeechButton> {
  final FlutterTts flutterTts = FlutterTts();

  Future<void> _speak() async {
    // ตั้งค่า TTS สำหรับภาษาไทย
    await flutterTts.setLanguage("th-TH");
    await flutterTts.setSpeechRate(0.5); // ความเร็วในการพูด (0.5 คือปกติ)
    await flutterTts.setVolume(1.0); // ระดับเสียง (0.0 ถึง 1.0)
    await flutterTts.setPitch(1.0); // ระดับโทนเสียง (0.5 ถึง 2.0)

    // เริ่มพูด
    await flutterTts.speak(widget.textToSpeak);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            icon: Icon(Icons.volume_up),
            color: Colors.green,
            onPressed: () {
              _speak(); // เรียกใช้งาน TTS เมื่อกดปุ่ม
            },
          ),
          Expanded(
            child: Text(
              widget.textToSpeak,
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
