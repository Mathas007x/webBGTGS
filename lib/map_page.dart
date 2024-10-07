import 'package:flutter/material.dart';
import 'garden_info.dart';
import 'garden_card.dart';

class MapPage extends StatelessWidget {
  void showGardenPopup(BuildContext context, int gardenNumber) {
    final garden = gardens[gardenNumber];
    if (garden != null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return GardenCard(
            title: garden['name'] ?? 'Unknown Garden',
            details: garden['details'] ?? 'Details not available.',
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // ขนาดที่แท้จริงของรูปภาพ
    final double originalMapWidth = 5360.0; // ขนาดจริงของภาพ
    final double originalMapHeight = 2940.0;

    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        double screenHeight = constraints.maxHeight;

        // คำนวณสัดส่วนของแผนที่โดยยึดตามขนาดของหน้าจอ (คำนวณตามความกว้าง)
        double mapScale = screenWidth / originalMapWidth;

        return InteractiveViewer(
          minScale: 0.5,
          maxScale: 3.0,
          child: Center(
            child: Stack(
              children: [
                // แสดงภาพแผนที่ตามสัดส่วนของหน้าจอ
                Image.asset(
                  'assets/Map.png',
                  width: originalMapWidth * mapScale,
                  height: originalMapHeight * mapScale,
                  fit: BoxFit.contain,
                ),
                // ปักมุดที่ตำแหน่งต่างๆ โดยใช้พิกัดที่ได้มาจากการวัด
                Positioned(
                  top: 2442 * mapScale, // พิกัด y ของเลข 1
                  left: 4024 * mapScale, // พิกัด x ของเลข 1
                  child: Transform.translate(
                    offset: Offset(-15 * mapScale, -30 * mapScale), // ปรับมุมตำแหน่งเล็กน้อย
                    child: IconButton(
                      icon: Icon(Icons.location_on,
                          color: Colors.green, size: 30 * mapScale),
                      onPressed: () => showGardenPopup(context, 1),
                    ),
                  ),
                ),
                Positioned(
                  top: 1840 * mapScale,
                  left: 3700 * mapScale,
                  child: Transform.translate(
                    offset: Offset(-15 * mapScale, -30 * mapScale),
                    child: IconButton(
                      icon: Icon(Icons.location_on,
                          color: Colors.red, size: 30 * mapScale),
                      onPressed: () => showGardenPopup(context, 2),
                    ),
                  ),
                ),
                Positioned(
                  top: 1500 * mapScale,
                  left: 4215 * mapScale,
                  child: Transform.translate(
                    offset: Offset(-15 * mapScale, -30 * mapScale),
                    child: IconButton(
                      icon: Icon(Icons.location_on,
                          color: const Color.fromARGB(255, 243, 37, 33), size: 30 * mapScale),
                      onPressed: () => showGardenPopup(context, 3),
                    ),
                  ),
                ),
                Positioned(
                  top: 1220 * mapScale,
                  left: 4213 * mapScale,
                  child: Transform.translate(
                    offset: Offset(-15 * mapScale, -30 * mapScale),
                    child: IconButton(
                      icon: Icon(Icons.location_on,
                          color: Colors.orange, size: 30 * mapScale),
                      onPressed: () => showGardenPopup(context, 4),
                    ),
                  ),
                ),
                Positioned(
                  top: 1280 * mapScale,
                  left: 3560 * mapScale,
                  child: Transform.translate(
                    offset: Offset(-15 * mapScale, -30 * mapScale),
                    child: IconButton(
                      icon: Icon(Icons.location_on,
                          color: Colors.purple, size: 30 * mapScale),
                      onPressed: () => showGardenPopup(context, 5),
                    ),
                  ),
                ),
                Positioned(
                  top: 950 * mapScale,
                  left: 3490 * mapScale,
                  child: Transform.translate(
                    offset: Offset(-15 * mapScale, -30 * mapScale),
                    child: IconButton(
                      icon: Icon(Icons.location_on,
                          color: Colors.yellow, size: 30 * mapScale),
                      onPressed: () => showGardenPopup(context, 6),
                    ),
                  ),
                ),
                Positioned(
                  top: 785 * mapScale,
                  left: 3760 * mapScale,
                  child: Transform.translate(
                    offset: Offset(-15 * mapScale, -30 * mapScale),
                    child: IconButton(
                      icon: Icon(Icons.location_on,
                          color: Colors.teal, size: 30 * mapScale),
                      onPressed: () => showGardenPopup(context, 7),
                    ),
                  ),
                ),
                Positioned(
                  top: 145 * mapScale,
                  left: 3927 * mapScale,
                  child: Transform.translate(
                    offset: Offset(-15 * mapScale, -30 * mapScale),
                    child: IconButton(
                      icon: Icon(Icons.location_on,
                          color: Colors.brown, size: 30 * mapScale),
                      onPressed: () => showGardenPopup(context, 8),
                    ),
                  ),
                ),
                Positioned(
                  top: 420 * mapScale,
                  left: 2744 * mapScale,
                  child: Transform.translate(
                    offset: Offset(-15 * mapScale, -30 * mapScale),
                    child: IconButton(
                      icon: Icon(Icons.location_on,
                          color: Colors.green, size: 30 * mapScale),
                      onPressed: () => showGardenPopup(context, 9),
                    ),
                  ),
                ),
                Positioned(
                  top: 452 * mapScale,
                  left: 2045 * mapScale,
                  child: Transform.translate(
                    offset: Offset(-15 * mapScale, -30 * mapScale),
                    child: IconButton(
                      icon: Icon(Icons.location_on,
                          color: Colors.black, size: 30 * mapScale),
                      onPressed: () => showGardenPopup(context, 10),
                    ),
                  ),
                ),
                Positioned(
                  top: 1520 * mapScale,
                  left: 2185 * mapScale,
                  child: Transform.translate(
                    offset: Offset(-15 * mapScale, -30 * mapScale),
                    child: IconButton(
                      icon: Icon(Icons.location_on,
                          color: Colors.black, size: 30 * mapScale),
                      onPressed: () => showGardenPopup(context, 11),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
