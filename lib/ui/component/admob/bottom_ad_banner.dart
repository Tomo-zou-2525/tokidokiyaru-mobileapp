import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:tokidoki_mobile/ad_helper.dart';

class BottomAdBanner extends StatelessWidget {
  const BottomAdBanner({super.key});

  @override
  Widget build(BuildContext context) => Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: 60,
        child: AdWidget(ad: AdHelper.createBannerAd()..load()),
      );
}
