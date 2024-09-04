import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => WebViewPage()),
    );
  }
}
