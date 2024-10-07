// search_page.dart
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/LOGO.png'),
            radius: 100,
          ),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              hintText: 'ค้นหา...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              filled: true,
              fillColor: Colors.white.withOpacity(0.5),
              prefixIcon: Icon(Icons.search),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Add your search function here
              print('ค้นหา...');
            },
            child: Text('ค้นหา'),
          ),
        ],
      ),
    );
  }
}
