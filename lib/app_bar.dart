import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context, VoidCallback navigateToLogin) {
  return AppBar(
    title: Text('Bottom Navigation Bar Example'),
    leading: CircleAvatar(
      backgroundImage: AssetImage('assets/LOGO.png'),
    ),
    actions: [
      TextButton(
        onPressed: navigateToLogin,
        child: Text(
          'Login',
          style: TextStyle(color: Colors.black),
        ),
      ),
    ],
    backgroundColor: Colors.green,
  );
}