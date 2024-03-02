import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:tokidoki_mobile/domain/repository/repository.dart';
import 'package:tokidoki_mobile/infrastructure/db/dao.dart';
import 'package:tokidoki_mobile/infrastructure/db/init/db.dart';
import 'package:tokidoki_mobile/ui/page/home.dart';
import 'package:tokidoki_mobile/ui/page/privacy_policy_page.dart';
import 'package:tokidoki_mobile/ui/page/terms_page.dart';
import 'package:tokidoki_mobile/ui/page/tutorial_page.dart';
import 'package:tokidoki_mobile/ui/theme/app_text_style.dart';
import 'package:tokidoki_mobile/ui/theme/app_theme_color.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // １秒長くスプラッシュスクリーンを表示するのが見映えが良い
  await Future.delayed(const Duration(seconds: 1));
  FlutterNativeSplash.remove();

  final db = await DB.open();
  runApp(
    ProviderScope(
        overrides: [repositoryProvider.overrideWithValue(DAO(db: db))],
        child: const App()),
  );
}

final scaffoldKey = GlobalKey<ScaffoldMessengerState>();

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: scaffoldKey,
      home: const Home(),
      routes: {
        '/tutorial': (context) => const TutorialPage(),
        '/terms_of_service': (context) => const TermsPage(),
        '/privacy_policy': (context) => const PrivacyPolicyPage(),
      },
      title: 'Tokidoki',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          titleTextStyle: AppTextStyle.bigBold.style,
          backgroundColor: AppThemeColor.blueMain.color,
        ),
        scaffoldBackgroundColor: AppThemeColor.white.color,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppThemeColor.blueMain.color,
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
