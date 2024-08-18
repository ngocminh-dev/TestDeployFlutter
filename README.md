# photo_ai

Photo filter AI new Flutter project

## Getting Started

This is the version 2.0 of the mobile app, developed parallelly with the Yody Web
2.0.

A few resources to get you started:

## General structure

- assets
    - icons
        - outline: vuesax outline icons
        - bold: vuesax bold (filled) icons
        - custom: custom icons from designers
    - img
- build_helper: shell files to build ios/android apk/aab/ipa
- languages: language package
- lib:
    - __features__: all features used in app, considered as the Presentation layer with State management and pages/widgets.
    - __generated__: generated files such as Assets (FlutterAssetsGenerator plugin).
    - __init__: all the processes needed to initialize the app (env, DI, flavors, etc,.).
- packages:
    - __common_widgets__: contains common widgets, extensions used in app (bottom navigator, date picker, etc,.)
    - __core__: the base of the app. All the features inside should not depends on any other features and higher.
    - __data__: the data layer of the app (models, dtos and api services).
    - __domain__: the domain layer of the app (repositories and mappers).

## Plugin support

1. [Bloc](https://plugins.jetbrains.com/plugin/12129-bloc)
2. [Flutter Freezed Snippets](https://plugins.jetbrains.com/plugin/18258-flutter-freezed-snippets)
3. [Flutter-Toolkit](https://plugins.jetbrains.com/plugin/14442-flutter-toolkit)
4. [FlutterAssetsGenerator](https://plugins.jetbrains.com/plugin/15427-flutterassetsgenerator)
5. [Dart Barrel File Generator](https://plugins.jetbrains.com/plugin/18980-dart-barrel-file-generator)
6. [DartJsonGenerator](https://plugins.jetbrains.com/plugin/16971-dartjsongenerator)

## Extensions

- __BuildContext__:
  ```
  // For language, for example: context.loc.auth_loginWithSms
  AppLocale get loc => AppLocale.of(this); 
  
  // For TextStyle, for example: context.heading1
  TextStyle get heading1 => YDTextStyle.heading1;
  
  // For Color, for example: context.color.primary
  YDThemeExtension get color => Theme.of(this).extension<YDThemeExtension>()!;
  
  // Show bottom sheet
  Future<void> showBottomSheet(Widget builder,
      {bool isScrollControlled = false});
  
  /// Show toast
  void showToast(String title, ToastStatus status, {VoidCallback? onClose});
  ```

## Utils

### Utils Class
Utils file extracted from GetX. Added some custom validator.

### Makefile commands
Run `flutter pub get` in all the project packages
```
make pub_get_all
```

Run `flutter pub run build_runner build` in all the project packages
```
make generate_sources_all
```

Runs `flutter clean` in all the project packages
```
make clean_all
```

### Shell
```sh
$ flutter pub run build_runner build
$ flutter packages pub run build_runner build --delete-conflicting-outputs 
```

### Build
ios/Certificates_yody_distribute.p12 -> pass: 1234
All build commands is packed in build_helper folder.

## Abbreviation
- loc: locale
- sl: service locator
