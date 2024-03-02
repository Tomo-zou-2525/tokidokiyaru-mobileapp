import 'package:flutter/material.dart';
import 'package:flutter_overboard/flutter_overboard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tokidoki_mobile/ui/theme/app_theme_color.dart';

class TutorialPage extends StatefulWidget {
  const TutorialPage({Key? key}) : super(key: key);

  @override
  TutorialPageState createState() => TutorialPageState();
}

class TutorialPageState extends State<TutorialPage>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      body: OverBoard(
        allowScroll: true,
        pages: pages,
        showBullets: true,
        inactiveBulletColor: Colors.blue,
        skipCallback: () {
          _setTutorialDone();
          Navigator.pushNamed(context, '/');
        },
        finishCallback: () {
          _setTutorialDone();
          Navigator.pushNamed(context, '/');
        },
      ),
    );
  }

  final List<_SimplePageModel> pages = [
    _SimplePageModel(
      title: "”ときどき”やること",
      imageAssetPath: "assets/images/1.png",
      body:
          "車のオイルを交換したのはいつ？\n押入れの掃除をしたのはいつ？\n歯医者に行ったのはいつ？\n\nそんな、”ときどき”必要なタスクの中で、私たちは生活しています。",
      backgroundColor: AppThemeColor.blueMain.color,
    ),
    _SimplePageModel(
      title: "”Tokidoki”と、\nToDoアプリの違い",
      imageAssetPath: "assets/images/2.png",
      body: "１回やって終わるならTodoアプリ。\n\nでも、何度も繰り返したいタスクの管理には”Tokidoki”がピッタリです。",
      backgroundColor: AppThemeColor.blueMain.color,
    ),
    _SimplePageModel(
      title: "Let’s Tokidoki!",
      imageAssetPath: "assets/images/4.png",
      body:
          "使い方はとてもシンプル。タスクを登録しておき、ボタンを押すだけ！\n\n日々の生活をよりよくしていくための強力なツールとして、”Tokidoki”を是非とも活用してください！",
      backgroundColor: AppThemeColor.blueMain.color,
    ),
  ];
}

class _SimplePageModel extends PageModel {
  _SimplePageModel({
    required String title,
    required String imageAssetPath,
    required String body,
    required Color backgroundColor,
  }) : super(
          color: backgroundColor,
          imageAssetPath: imageAssetPath,
          title: title,
          titleColor: Colors.black,
          body: body,
          bodyColor: Colors.black,
          doAnimateImage: true,
        );
}

void _setTutorialDone() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('isFirst', true);
}
