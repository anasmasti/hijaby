import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashScreenStat();
  }
}

class SplashScreenStat extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 2 ), () {
      Navigator.pushNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color:  Colors.deepPurple.shade50,
      child: Center(
        child: Hero(
          tag: 'splash',
          child: SizedBox(
            child: ColorizeAnimatedTextKit(
              text: [
                "Hijaby",
              ],
              textStyle: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w900,
                decoration: TextDecoration.none,
                fontStyle: FontStyle.normal,
                fontFamily: 'Raleway',
              ),
              colors: [
                Colors.deepPurple.shade600,
                Colors.deepPurple.shade200,
                Colors.deepPurple.shade600,
                Colors.deepPurple.shade200,
              ],
              textAlign: TextAlign.start,
            ),
      ),
        )),
    );
  }
}
