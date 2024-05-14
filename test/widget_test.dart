// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lib/main.dart'; // นี่ควรเป็น path ที่ถูกต้องสำหรับไฟล์ main.dart ของคุณ

void main() {
  testWidgets('BottomNavigationBar test', (WidgetTester tester) async {
    // สร้าง widget ที่จะถูกทดสอบ
    await tester.pumpWidget(MyApp());

    // ทดสอบว่ามี BottomNavigationBar ปรากฏใน widget tree
    expect(find.byType(BottomNavigationBar), findsOneWidget);

    // ทดสอบว่ามี BottomNavigationBarItem ทั้งหมด 4 อัน
    expect(find.byType(BottomNavigationBarItem), findsNWidgets(4));

    // ทดสอบว่าไอคอนหน้าแรกปรากฏและสามารถคลิกได้
    expect(find.text('หน้าแรก'), findsOneWidget);
    await tester.tap(find.text('หน้าแรก'));
    await tester.pump();

    // ทดสอบว่าไอคอน MAP ปรากฏและสามารถคลิกได้
    expect(find.text('MAP'), findsOneWidget);
    await tester.tap(find.text('MAP'));
    await tester.pump();

    // ทดสอบว่าไอคอน search ปรากฏและสามารถคลิกได้
    expect(find.text('search'), findsOneWidget);
    await tester.tap(find.text('search'));
    await tester.pump();

    // ทดสอบว่าไอคอน FacebookMFU ปรากฏและสามารถคลิกได้
    expect(find.text('FacebookMFU'), findsOneWidget);
    await tester.tap(find.text('FacebookMFU'));
    await tester.pump();
  });

  testWidgets('AppBar and buttons test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // ทดสอบว่า AppBar มีอยู่ใน widget tree
    expect(find.byType(AppBar), findsOneWidget);

    // ทดสอบว่า Login ปุ่มอยู่ใน AppBar และสามารถคลิกได้
    expect(find.text('Login'), findsOneWidget);
    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle(); // รอให้หน้าถัดไปโหลด

    // ทดสอบการกลับมาที่ MyHomePage
    await tester.pageBack();
    await tester.pumpAndSettle();

    // ทดสอบว่าปุ่มต่างๆ ใน Column ปรากฏ
    expect(find.text('สวนสมุนไพร\nMedicinal Plant Garden'), findsOneWidget);
    expect(find.text('อุทยานไม้ดอก\nForistic Garden'), findsOneWidget);
    expect(find.text('ลานวัฒนธรรม\nHome Garden of Ethnic Groups'), findsOneWidget);
    expect(find.text('สวนสน\nPine garden'), findsOneWidget);
    expect(find.text('สวนวัลยชาติ\nClimber Garden'), findsOneWidget);
    expect(find.text('สวนวิวัฒนาการ\nEvolution Garden'), findsOneWidget);
    expect(find.text('สวนพุทธพฤกษ์\nBhuddist Plant Garden'), findsOneWidget);
    expect(find.text('สวนพรรณไม้หายาก\nRare Plant Garden'), findsOneWidget);
    expect(find.text('สวนเบญจพฤกษ์\nBanana Bamboo Lotus Orchid and Giger Collection'), findsOneWidget);
    expect(find.text('สวนซากุระ\nSakura garden'), findsOneWidget);
  });

  testWidgets('Search page test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // ทดสอบการคลิกที่ไอคอน search และตรวจสอบว่า TextField ปรากฏ
    await tester.tap(find.text('search'));
    await tester.pump();
    expect(find.byType(TextField), findsOneWidget);

    // ป้อนข้อความใน TextField และกดปุ่มค้นหา
    await tester.enterText(find.byType(TextField), 'ค้นหาข้อมูล');
    await tester.tap(find.text('ค้นหา'));
    await tester.pump();

    // ตรวจสอบว่า TextField มีค่าที่ป้อนเข้าไป
    expect(find.text('ค้นหาข้อมูล'), findsOneWidget);
  });
}
