import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hijaby/pages/favorite_items.dart';
import 'package:hijaby/pages/privacy.dart';
import 'package:hijaby/pages/splash_screen.dart';
import 'package:hijaby/pages/home.dart';
import 'package:hijaby/pages/show_season.dart';
import 'package:flutter/services.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light));

  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData(fontFamily: 'Railway'),
        initialRoute: '/splash_screen',
        routes: {
          '/home': (context) => const Home(),
          '/season': (context) => ShowSeason(
                desc: '',
                id: '',
                img: '',
                index: '',
                name: '',
              ),
          '/splash_screen': (context) => const SplashScreen(),
          '/favorite': (context) => const FavoriteItems(),
          '/privacy': (context) => const Privacy(),
        },
        home: const SplashScreen(),
      );
}
