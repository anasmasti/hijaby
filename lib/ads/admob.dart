import 'package:firebase_admob/firebase_admob.dart';

class Admob {
  static BannerAd getBanner() {
    return BannerAd(
      adUnitId: 'ca-app-pub-3940256099942544/6300978111',
      size: AdSize.fullBanner,
    );
  }

  static InterstitialAd getInterstitial() {
    return InterstitialAd(
      adUnitId: 'ca-app-pub-3940256099942544/1033173712',
    );
  }
}
