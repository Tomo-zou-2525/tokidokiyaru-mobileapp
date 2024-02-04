import 'package:flutter/material.dart';
import 'package:flutter_overboard/flutter_overboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  final pages = [
    _SimplePageModel(
      title: 'こんなことを思ったことはありませんか？',
      imageAssetPath: 'assets/images/note.png',
      body: '「最後に髪を切ったのはいつだっけ？」\n「最後に大掃除をしたのはいつだっけ？」\n「最後に車のオイルを交換したのはいつだっけ？」',
      backgroundColor: const Color(0xFFDBE1FF),
    ),
    _SimplePageModel(
      title: 'このアプリの目的',
      imageAssetPath: 'assets/images/note.png',
      body:
          '私たちは生活の中で、”時々”やらなきゃいけないことがあると思います。この”TOKIDOKI”というアプリは、通常のTODOアプリとは異なり、”あまりやらないけど、でも何回もやる必要があるタスク”を管理するために生まれたアプリです。',
      backgroundColor: const Color(0xFFDBE1FF),
    ),
    _SimplePageModel(
      title: "どうやって使うの？",
      imageAssetPath: 'assets/images/note.png',
      body: '使い方はとてもシンプル。タスクを登録しておき、「打刻ボタン」を押すだけ！このメモが、未来のあなたをきっと助けてくれることでしょう。',
      backgroundColor: const Color(0xFFDBE1FF),
    ),
    _SimplePageModel(
      title: "Let's Start!",
      imageAssetPath: 'assets/images/note.png',
      body: '日々の生活をよりよくしていくための強力なツールとして、”TOKIDOKI”を是非とも活用してください！',
      backgroundColor: const Color(0xFFDBE1FF),
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
