.PHONY: setup generate generate-watch
setup:
	flutter clean
	flutter pub get

gen:
	flutter pub run build_runner build --delete-conflicting-outputs

gen_watch:
	flutter pub run build_runner watch --delete-conflicting-outputs
