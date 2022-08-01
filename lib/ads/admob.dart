import 'package:google_mobile_ads/google_mobile_ads.dart';

class Admob {
  static BannerAd getBanner() {
    return BannerAd(
      adUnitId: 'ca-app-pub-7266395079327700/5606288272',
      size: AdSize.fullBanner,
      request: const AdRequest(),
      listener: const BannerAdListener(),
    );
  }
}
