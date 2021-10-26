// import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:hijaby/ads/admob.dart';

// ignore: must_be_immutable
class Header extends StatefulWidget {
  const Header({key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HeaderState();
  }
}

class HeaderState extends State<Header> {
  // late InterstitialAd _interstitialAd;
  // @override
  // void initState() {
  //   super.initState();
  //   _interstitialAd = Admob.getInterstitial();
  //   _interstitialAd.load();
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _interstitialAd.dispose();
  // }

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
              // _interstitialAd.show().then((value) async {
              //   await Navigator.pushNamed(context, '/favorite');
              // });
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
