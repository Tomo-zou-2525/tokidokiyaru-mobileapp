.PHONY: setup generate generate-watch test
setup:
	flutter clean
	flutter pub get
gen:
	flutter pub run build_runner build --delete-conflicting-outputs
gen_watch:
	flutter pub run build_runner watch --delete-conflicting-outputs
test:
	flutter test
update_icon:
	flutter pub run flutter_launcher_icons:main
update_splash:
	flutter pub run flutter_native_splash:create