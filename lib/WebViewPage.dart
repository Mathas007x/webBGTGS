import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map'),
      ),
      body: WebView(
        initialUrl: Uri.dataFromString(
          '''
          <!DOCTYPE html>
          <html lang="en">
          <head>
              <meta charset="UTF-8">
              <meta name="viewport" content="width=device-width, initial-scale=1.0">
              <title>Map</title>
              <style>
                  html, body {
                      height: 100%;
                      margin: 0;
                      padding: 0;
                  }
                  #map {
                      height: 100%;
                      width: 100%;
                  }
              </style>
              <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&callback=initMap" async defer></script>
              <script>
                  function initMap() {
                      var location = { lat: -34.397, lng: 150.644 };
                      var map = new google.maps.Map(document.getElementById('map'), {
                          zoom: 8,
                          center: location
                      });
                      var marker = new google.maps.Marker({
                          position: location,
                          map: map
                      });
                  }
              </script>
          </head>
          <body>
              <div id="map"></div>
          </body>
          </html>
          ''',
          mimeType: 'text/html',
        ).toString(),
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
