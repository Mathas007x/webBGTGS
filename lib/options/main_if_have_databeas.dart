/*
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class Garden {
  final String title;
  final String content;
  final List<String> images;

  Garden({required this.title, required this.content, required this.images});

  factory Garden.fromJson(Map<String, dynamic> json) {
    return Garden(
      title: json['title'],
      content: json['content'],
      images: List<String>.from(json['images'].map((image) => image['url'])),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Strapi Flutter Integration',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: GardenListPage(),
    );
  }
}

class GardenListPage extends StatefulWidget {
  @override
  _GardenListPageState createState() => _GardenListPageState();
}

class _GardenListPageState extends State<GardenListPage> {
  late Future<List<Garden>> futureGardens;

  @override
  void initState() {
    super.initState();
    futureGardens = fetchGardens();
  }

  Future<List<Garden>> fetchGardens() async {
    final response = await http.get(Uri.parse('http://localhost:1337/gardens'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((garden) => Garden.fromJson(garden)).toList();
    } else {
      throw Exception('Failed to load gardens');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Garden List'),
        backgroundColor: Colors.green,
      ),
      body: FutureBuilder<List<Garden>>(
        future: futureGardens,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index].title),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(garden: snapshot.data![index]),
                      ),
                    );
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final Garden garden;

  DetailPage({required this.garden});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(garden.title),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200.0,
              child: PageView.builder(
                itemCount: garden.images.length,
                itemBuilder: (context, index) {
                  return Image.network(garden.images[index], fit: BoxFit.cover);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                garden.content,
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/
///////


/*ใช้ Strapi เพื่อจัดการกับข้อมูลของสวนและดึงข้อมูลจาก Strapi API มาแสดงในแอป Flutter ของคุณได้ ด้านล่างนี้เป็นตัวอย่างวิธีการรวม Strapi กับ Flutter:

### ขั้นตอนการทำงาน

1. **ตั้งค่า Strapi**: ติดตั้งและตั้งค่า Strapi เพื่อสร้างและจัดการข้อมูลของสวน

2. **สร้างโมเดลใน Strapi**: สร้าง Content Type ที่จำเป็นใน Strapi เช่น `Garden`

3. **ตั้งค่า API Permissions**: ตรวจสอบว่า API permissions ถูกตั้งค่าให้อนุญาตการเข้าถึงข้อมูล

4. **เรียกใช้ API ใน Flutter**: ใช้ HTTP package เพื่อเรียก API จาก Strapi

### ตัวอย่างโค้ด

#### 1. ตั้งค่า Strapi

- ติดตั้ง Strapi และสร้างโปรเจ็กต์ใหม่:

```bash
npx create-strapi-app my-project --quickstart
```

- สร้าง Content Type `Garden` โดยมีฟิลด์ต่างๆ เช่น `title`, `content`, `images` เป็นต้น

#### 2. Flutter Project

- เพิ่ม dependency สำหรับ HTTP package ใน `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^0.14.0
```

- สร้างโค้ดสำหรับดึงข้อมูลจาก Strapi และแสดงในแอป:

```dart*/

/* การเปลี่ยนแปลงที่สำคัญ

1. **ตั้งค่า HTTP package**: เพิ่ม dependency สำหรับ HTTP package
2. **สร้างคลาส `Garden`**: สำหรับจัดการข้อมูลของสวนที่ดึงจาก Strapi
3. **ดึงข้อมูลจาก Strapi**: ใน `GardenListPage`, ดึงข้อมูลจาก Strapi และแสดงรายการใน ListView
4. **แสดงรายละเอียดของสวน**: ใน `DetailPage`, แสดงข้อมูลรายละเอียดของสวนที่ดึงจาก Strapi

### ข้อสำคัญ

- ตรวจสอบให้แน่ใจว่า Strapi API สามารถเข้าถึงได้จากแอป Flutter ของคุณ (เช่น เปิด API permissions)
- ในตัวอย่างนี้ใช้ URL `http://localhost:1337/gardens` สำหรับการดึงข้อมูล คุณอาจต้องปรับเปลี่ยน URL ให้ตรงกับการตั้งค่าของคุณ

คุณสามารถเพิ่มข้อมูลเพิ่มเติมและฟิลด์ต่างๆ ได้ตามต้องการ และปรับปรุง UI ของแอป Flutter เพื่อให้ตรงกับความต้องการของคุณ*/