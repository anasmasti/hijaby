import 'package:flutter/material.dart';
import 'package:hijaby/pages/components/splash_screen.dart';
import 'package:hijaby/pages/home.dart';
import 'package:hijaby/pages/show_season.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light));
  runApp(MaterialApp(
    theme: ThemeData(fontFamily: 'Raleway'),
    initialRoute: '/splash_screen',
    routes: {
      '/home': (context) => Home(),
      '/season': (context) => ShowSeason(),
      '/splash_screen': (context) => SplashScreen(),
    },
    home: new MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen();
  }
}
