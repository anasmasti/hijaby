// import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class Header extends StatefulWidget {
  const Header({key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HeaderState();
  }
}

class HeaderState extends State<Header> {
  late InterstitialAd _interstitialAd;

  @override
  void initState() {
    super.initState();
    // Admob.getInterstitial(_interstitialAd);
    InterstitialAd.load(
        adUnitId: 'ca-app-pub-3940256099942544/8691691433',
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            // Keep a reference to the ad so you can show it later.
            _interstitialAd = ad;
          },
          onAdFailedToLoad: (LoadAdError error) {
            // ignore: avoid_print
            print('InterstitialAd failed to load: $error');
          },
        ));
  }

  @override
  void dispose() {
    super.dispose();
    _interstitialAd.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2, left: 11, right: 17),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Hijaby',
            style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w900,
                fontSize: 35),
          ),
          // ignore: deprecated_member_use
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/favorite');
              _interstitialAd.show().then((_) async {
                await Navigator.pushNamed(context, '/favorite');
              });
            },
            color: Colors.deepPurple[200],
            textColor: Colors.white,
            child: Column(
              children: const [
                Icon(
                  Icons.favorite_outline,
                  size: 29,
                ),
              ],
            ),
            padding:
                const EdgeInsets.only(top: 4, bottom: 4, left: 9, right: 9),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          ),
        ],
      ),
    );
  }
}
