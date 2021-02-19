import 'package:flutter/material.dart';
import 'package:hijaby/pages/privacy.dart';
import 'package:hijaby/pages/splash_screen.dart';
import 'package:hijaby/pages/favorite_items.dart';
import 'package:hijaby/pages/home.dart';
import 'package:hijaby/pages/show_season.dart';
import 'package:flutter/services.dart';

void main() async {
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
      '/favorite': (context) => FavoriteItems(),
      '/privacy': (context) => Privacy(),
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
