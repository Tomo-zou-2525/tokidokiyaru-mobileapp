import 'dart:io';

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
}
