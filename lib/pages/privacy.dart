import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Privacy extends StatefulWidget {
  const Privacy({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return PrivacyState();
  }
}

class PrivacyState extends State<Privacy> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  icon: const Icon(Icons.arrow_back_ios),
                  color: Colors.black,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 3, top: 5),
                  child: Text(
                    'Privacy policy',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w900,
                      fontSize: 30,
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: const WebView(
                    initialUrl: 'https://hijaby.herokuapp.com/privacypolicy',
                  )),
            )
          ],
        )
      ],
    ));
  }
}
