import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Privacy extends StatefulWidget {
  Privacy();

  @override
  State<StatefulWidget> createState() {
    return new PrivacyState();
  }
}

class PrivacyState extends State<Privacy> {
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Stack(
      children: [
        ListView(
          scrollDirection: Axis.vertical,
          children: [
            Row(
              
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.black,
                ),
                Padding(
                  padding: const EdgeInsets.only(left:3, top:5),
                  child: Text('Privacy policy',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                  ),),
                )
              ],
            ),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                  child: WebView(
                   initialUrl: 'https://hijaby.herokuapp.com/privacypolicy',
              )),
            )
          ],
        )
      ],
    ));
  }
}
