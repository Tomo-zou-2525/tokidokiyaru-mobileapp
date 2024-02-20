import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-2642642353866915/2228078019';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-2642642353866915/9358810181';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static BannerAd createBannerAd() => BannerAd(
        adUnitId: bannerAdUnitId,
        size: AdSize.banner,
        request: const AdRequest(),
        listener: const BannerAdListener(),
      );
}
