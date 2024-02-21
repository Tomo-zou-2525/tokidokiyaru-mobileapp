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

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Home(),
      routes: {
        '/tutorial': (context) => const TutorialPage(),
        '/terms_of_service': (context) => const TermsPage(),
        '/privacy_policy': (context) => const PrivacyPolicyPage(),
      },
      title: 'Tokidoki',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xFFDBE1FF)),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2764EF)),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
