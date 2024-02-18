import 'package:flutter/material.dart';

class BaseDrawer extends StatelessWidget {
  const BaseDrawer({super.key});

  @override
  Widget build(BuildContext context) => Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text("このアプリについて"),
              onTap: () {
                Navigator.pushNamed(context, '/tutorial');
              },
            ),
            ListTile(
              title: const Text("利用規約"),
              onTap: () {
                Navigator.pushNamed(context, '/terms_of_service');
              },
            ),
            ListTile(
              title: const Text("プライバシーポリシー"),
              onTap: () {
                Navigator.pushNamed(context, '/privacy_policy');
              },
            ),
          ],
        ),
      );
}
