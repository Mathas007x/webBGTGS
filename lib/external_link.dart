import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ExternalLink extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        const url = 'https://www.facebook.com/mfubotanicalgarden';
        if (await canLaunch(url)) {
          await launch(url);
        } else {
          throw 'Could not launch $url';
        }
      },
      child: Container(
        alignment: Alignment.center,
        child: Text(
          'Visit https://www.facebook.com/mfubotanicalgarden',
          style: TextStyle(
            color: Colors.blue,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
