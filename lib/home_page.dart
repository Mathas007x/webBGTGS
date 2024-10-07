import 'package:flutter/material.dart';
import 'Detailpage.dart';

class HomePage extends StatelessWidget {
  void _navigateToDetailPage(BuildContext context, String title, String content, List<String> imagePaths) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(title: title, content: content, imagePaths: imagePaths),
      ),
    );
  }

  Widget buildCard(BuildContext context, String text, String title, String content, List<String> imagePaths) {
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
            _navigateToDetailPage(context, title, content, imagePaths);
          },
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                  children: [
                    // ใส่ข้อมูลสวนสมุนไพร
                    buildCard(
                      context, 
                      'สวนสมุนไพร\nMedicinal Plant Garden', 
                      'สวนสมุนไพร', 
                      'สวนสมุนไพรเป็นที่รวมสมุนไพรหลากหลายชนิดที่ใช้ในการแพทย์แผนไทย...',
                      ['assets/medicinal_plant1.jpg', 'assets/medicinal_plant2.jpg']
                    ),
                    SizedBox(height: 10),
                    // ใส่ข้อมูลอุทยานไม้ดอก
                    buildCard(
                      context, 
                      'อุทยานไม้ดอก\nForistic Garden', 
                      'อุทยานไม้ดอก', 
                      'อุทยานไม้ดอกประกอบไปด้วยพรรณไม้ดอกหลากสีสัน...',
                      ['assets/foristic_garden1.jpg', 'assets/foristic_garden2.jpg']
                    ),
                    SizedBox(height: 10),
                    // ใส่ข้อมูลลานวัฒนธรรม
                    buildCard(
                      context, 
                      'ลานวัฒนธรรม\nHome Garden of Ethnic Groups', 
                      'ลานวัฒนธรรม', 
                      'ลานวัฒนธรรมแสดงถึงความหลากหลายของชนเผ่า...',
                      ['assets/ethnic_garden1.jpg', 'assets/ethnic_garden2.jpg']
                    ),
                    SizedBox(height: 10),
                    // ใส่ข้อมูลสวนสน
                    buildCard(
                      context, 
                      'สวนสน\nPine garden', 
                      'สวนสน', 
                      'สวนสนมีต้นสนหลายสายพันธุ์ที่เจริญเติบโตในพื้นที่...',
                      ['assets/pine_garden1.jpg', 'assets/pine_garden2.jpg']
                    ),
                    SizedBox(height: 10),
                    // ใส่ข้อมูลสวนวัลยชาติ
                    buildCard(
                      context, 
                      'สวนวัลยชาติ\nClimber Garden', 
                      'สวนวัลยชาติ', 
                      'สวนวัลยชาติประกอบด้วยพรรณไม้เลื้อยหลากหลายชนิด...',
                      ['assets/climber_garden1.jpg', 'assets/climber_garden2.jpg']
                    ),
                  ],
                ),
                Column(
                  children: [
                    // ใส่ข้อมูลสวนวิวัฒนาการ
                    buildCard(
                      context, 
                      'สวนวิวัฒนาการ\nEvolution Garden', 
                      'สวนวิวัฒนาการ', 
                      'สวนวิวัฒนาการแสดงถึงการเปลี่ยนแปลงของพรรณไม้...',
                      ['assets/evolution_garden1.jpg', 'assets/evolution_garden2.jpg']
                    ),
                    SizedBox(height: 10),
                    // ใส่ข้อมูลสวนพุทธพฤกษ์
                    buildCard(
                      context, 
                      'สวนพุทธพฤกษ์\nBhuddist Plant Garden', 
                      'สวนพุทธพฤกษ์', 
                      'สวนพุทธพฤกษ์เป็นที่รวมพรรณไม้ที่เกี่ยวข้องกับศาสนาพุทธ...',
                      ['assets/bhuddist_garden1.jpg', 'assets/bhuddist_garden2.jpg']
                    ),
                    SizedBox(height: 10),
                    // ใส่ข้อมูลสวนพรรณไม้หายาก
                    buildCard(
                      context, 
                      'สวนพรรณไม้หายาก\nRare Plant Garden', 
                      'สวนพรรณไม้หายาก', 
                      'สวนพรรณไม้หายากประกอบด้วยพรรณไม้ที่ใกล้สูญพันธุ์...',
                      ['assets/rare_plant_garden1.jpg', 'assets/rare_plant_garden2.jpg']
                    ),
                    SizedBox(height: 10),
                    // ใส่ข้อมูลสวนเบญจพฤกษ์
                    buildCard(
                      context, 
                      'สวนเบญจพฤกษ์\nBanana Bamboo Lotus Orchid and Giger Collection', 
                      'สวนเบญจพฤกษ์', 
                      'สวนเบญจพฤกษ์รวบรวมพรรณไม้ที่สำคัญในวัฒนธรรมไทย...',
                      ['assets/bananas_collection1.jpg', 'assets/bananas_collection2.jpg']
                    ),
                    SizedBox(height: 10),
                    // ใส่ข้อมูลสวนซากุระ
                    buildCard(
                      context, 
                      'สวนซากุระ\nSakura garden', 
                      'สวนซากุระ', 
                      'สวนซากุระมีต้นซากุระที่ผลิดอกในช่วงฤดูใบไม้ผลิ...',
                      ['assets/sakura_garden1.jpg', 'assets/sakura_garden2.jpg']
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
        
      
    
  }
}
