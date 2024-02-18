import 'package:flutter/material.dart';

Widget createBaseDrawer(BuildContext context) => Drawer(
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
