# tokidoki_mobile

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# リリース時の注意点
リリース担当者：左近

## Android
```
// リリースコマンド ※ --no-tree-shake-icons 必須
flutter build appbundle --release --no-tree-shake-icons
```
## iOS
コマンドは不要  
```
- XCodeで ios/Runner.xcworkspaceを開く
- Product > Build
- Product > Archive
```