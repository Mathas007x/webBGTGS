import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeechButton extends StatefulWidget {
  final String textToSpeak; // ข้อความที่ต้องการให้ TTS อ่าน

  const TextToSpeechButton({Key? key, required this.textToSpeak})
      : super(key: key);

  @override
  _TextToSpeechButtonState createState() => _TextToSpeechButtonState();
}

class _TextToSpeechButtonState extends State<TextToSpeechButton> {
  final FlutterTts flutterTts = FlutterTts();
  String? selectedVoice;

  @override
  void initState() {
    super.initState();
    _initTts();
  }

  Future<void> _initTts() async {
    // ดึงข้อมูลเสียงที่มีอยู่
    List<dynamic> voices = await flutterTts.getVoices;
    for (var voice in voices) {
      if (voice["locale"] == "th-TH") {
        setState(() {
          selectedVoice = voice["name"]; // เลือกเสียงภาษาไทย
        });
        break;
      }
    }
  }

  Future<void> _speak() async {
    try {
      await flutterTts.setLanguage("th-TH");
      await flutterTts
          .setSpeechRate(0.4); // ความเร็วที่ลดลงเล็กน้อยเพื่อความชัดเจน
      await flutterTts.setVolume(1.0); // ระดับเสียงสูงสุด
      await flutterTts.setPitch(1.1); // โทนเสียงสูงขึ้นเล็กน้อย
      if (selectedVoice != null) {
        await flutterTts
            .setVoice({"name": selectedVoice ?? "default", "locale": "th-TH"});
      }

      await flutterTts.speak(widget.textToSpeak);
    } catch (e) {
      print('Error in TTS: $e');
    }
  }

  Future<void> _stop() async {
    try {
      await flutterTts.stop();
    } catch (e) {
      print('Error stopping TTS: $e');
    }
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
          IconButton(
            icon: Icon(Icons.stop),
            color: Colors.red,
            onPressed: _stop, // หยุดการพูดเมื่อกดปุ่มหยุด
          ),
          Expanded(
            child: Text(
              widget.textToSpeak,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
