import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SplashScreenStat();
  }
}

class SplashScreenStat extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () {
      Navigator.pushNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple.shade50,
      child: Center(
        child: SizedBox(
          child: AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                'Hijaby',
                textStyle: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w900,
                  decoration: TextDecoration.none,
                  fontStyle: FontStyle.normal,
                  fontFamily: 'Raleway',
                  color: Colors.deepPurple,
                ),
                speed: const Duration(milliseconds: 2000),
              ),
            ],
            totalRepeatCount: 4,
            pause: const Duration(milliseconds: 1000),
            displayFullTextOnTap: true,
            stopPauseOnTap: true,
          ),
        ),
      ),
    );
  }
}
