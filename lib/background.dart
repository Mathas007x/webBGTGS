import 'package:flutter/material.dart';

class BaseLayout extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return  Scaffold(
      body:  Container(
        child:  Column(// background
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 844,
              width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/BG.jpg"),
                    fit: BoxFit.cover),
              ),
            ), 
          ]
        )
      )
    );
  }
}