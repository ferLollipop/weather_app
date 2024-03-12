# weather_app_cubit

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

```bash
# Flutter build generate
flutter pub run build_runner build --delete-conflicting-outputs && dart format -l 100 lib
#dart 3 or later
dart run build_runner build --delete-conflicting-outputs && dart format -l 100 lib

# Flutter localization generate
flutter pub run easy_localization:generate -f keys -S assets/translations -o locale_keys.g.dart
#dart 3 or later
dart run easy_localization:generate -f keys -S assets/translations -o locale_keys.g.dart
```

Для авторизации использовать кредиты:
login: test@test.ru
password: qwerty1234
