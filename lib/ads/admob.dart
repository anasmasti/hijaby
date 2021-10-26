import 'package:google_mobile_ads/google_mobile_ads.dart';

class Admob {
  static BannerAd getBanner() {
    return BannerAd(
      adUnitId: 'ca-app-pub-3940256099942544/6300978111',
      size: AdSize.fullBanner,
      request: const AdRequest(),
      listener: const BannerAdListener(),
    );
  }

//   static InterstitialAd getInterstitial() {
//     return
// InterstitialAd.load(
//   adUnitId: '<ad unit id>',
//   request: AdRequest(),
//   adLoadCallback: InterstitialAdLoadCallback(
//     onAdLoaded: (InterstitialAd ad) {
//       // Keep a reference to the ad so you can show it later.
//       this._interstitialAd = ad;
//     },
//     onAdFailedToLoad: (LoadAdError error) {
//       print('InterstitialAd failed to load: $error');
//     },
//   ));
//   }
}
