import 'package:flutter/material.dart';

class HomePageContent extends StatelessWidget {
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
          // Add other widgets here
        ],
      ),
    );
  }
}
