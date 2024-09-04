import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io'; // For platform check

class WebViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Enable hybrid composition on Android
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('WebView Example'),
      ),
      body: WebView(
        initialUrl: 'https://www.example.com',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
