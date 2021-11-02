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
}
