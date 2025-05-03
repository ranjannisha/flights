# flight

A new Flutter project.

## Getting Started

Required Plugin on IDe or Editor
- VS Code
- Android Studio
- XCode

This project contains 3 flavors:

- development
- staging
- production

```
COPY .env-dev.example .env-dev
```
>[!NOTE]
for staging `.env-staging` for production `.env-prod`

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the
following commands:

```sh
# Development for developer
$ flutter run --flavor development --target lib/main_development.dart

# staging for QA team
$ flutter run --flavor staging --target lib/main_staging.dart

# Production for Production
$ flutter run --flavor production --target lib/main_production.dart
```

_\*Investment App works on iOS, Android

---


## Code generation for utilities (Routes,Model,Blocs)

```sh
$ flutter pub run build_runner build --delete-conflicting-outputs 

or for watch query

$ flutter pub run build_runner watch --delete-conflicting-outputs 

```

## Running Tests 🧪

To run all unit and widget tests use the following command:

```sh
$ flutter test --coverage --test-randomize-ordering-seed random
```

To view the generated coverage report you can use [lcov](https://github.com/linux-test-project/lcov)
.

```sh
# Generate Coverage Report
$ genhtml coverage/lcov.info -o coverage/

# Open Coverage Report
$ open coverage/index.html
```

---

## Working with Translations 🌐

This project relies on [flutter_localizations][flutter_localizations_link] and follows
the [official internationalization guide for Flutter][internationalization_link].

### Adding Strings

1. To add a new localizable string, open the `app_en.arb` file at `lib/l10n/arb/app_en.arb`.

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    }
}
```

2. Then add a new key/value and description

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    },
    "helloWorld": "Hello World",
    "@helloWorld": {
        "description": "Hello World Text"
    }
}
```

3. Use the new string

```dart
import 'package:durapp/l10n/l10n.dart';

@override
Widget build(BuildContext context) {
  final l10n = context.l10n;
  return Text(l10n.helloWorld);
}
```

### Adding Supported Locales

Update the `CFBundleLocalizations` array in the `Info.plist` at `ios/Runner/Info.plist` to include
the new locale.

```xml
    ...

<key>CFBundleLocalizations</key>
<array>
    <string>en</string>
    <string>es</string>
</array>

    ...
```

### Adding Translations

1. For each supported locale, add a new ARB file in `lib/l10n/arb`.

```
├── l10n
│   ├── arb
│   │   ├── app_en.arb

```

2. Add the translated strings to each `.arb` file:

`app_en.arb`

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    }
}
```

## Requirements

Before running this project, make sure you have the following installed:

- Flutter: 3.19.5
- Dart: 3.3.3
- DevTools: 2.31.1

You can clone the Flutter SDK from the official GitHub repository:
```bash
    git clone -b master https://github.com/flutter/flutter.git
```


## For test coverage Sonar Qube
# Installation
Refer to  [documentation](https://docs.sonarsource.com/sonarqube/latest/setup-and-upgrade/install-the-server/introduction/)

```shell
    # Download dependencies 
    flutter pub get 
    # Run tests with User feedback (in case some test are failing)
    flutter test
    # Run tests without user feedback regeneration tests.output and coverage/lcov.info
    flutter test --machine --coverage > tests.output 
    
    # Run the analysis and publish to the SonarQube server
    sonar-scanner
```

# Building Flutter App for Production

## Step 1: Update Dependencies

Before building your app for production, ensure that all dependencies in your `pubspec.yaml` file are up-to-date. Run the following command in your project directory to update dependencies:

bash

Copy code

`flutter pub get`

## Step 2: Set Up Environment Variables

If your app requires environment-specific configurations, ensure that you have properly set up environment variables for your production environment. These variables could include API keys, server URLs, and other sensitive information.

## Step 3: Configure Build Settings

### Android

1.  Open `android/app/build.gradle` file in your Flutter project.
2.  Update the `minSdkVersion` and `targetSdkVersion` to meet your app's requirements.
3.  Configure signing for release builds. You can generate a keystore file and update the signing configuration in the `android/app/build.gradle` file.

### iOS

1.  Open `ios/Runner.xcworkspace` in Xcode.
2.  Set the **Deployment Target** to the minimum iOS version supported by your app.
3.  Configure code signing and provisioning profiles for release builds in Xcode.

## Step 4: Generate Release Build

### Android

Run the following command to generate an APK file for your Flutter app:

bash

Copy code

```sh
# Build Apk in release mode
$ flutter build apk --release --flavor production --target lib/main_production.dart
```

This command generates an APK file in the `build/app/outputs/flutter-apk` directory.

### iOS

Run the following command to generate an IPA file for your Flutter app:

bash

Copy code

`flutter build ios --release --flavor production --target lib/main_production.dart`

This command generates an IPA file in the `build/ios/archive` directory.

## Step 5: Test Your Production Build

Before distributing your app, it's crucial to thoroughly test the production build to ensure that everything works as expected. Test all the features of your app on real devices and emulators.

## Step 6: Distribute Your App

### Android

To distribute your Android app, you can upload the generated APK file to Google Play Console. Follow the instructions provided by Google Play Console to create a release and distribute your app to users.

### iOS

To distribute your iOS app, you can upload the generated IPA file to App Store Connect. Follow the instructions provided by App Store Connect to create a new app version and submit it for review.

## Step 7: Monitor and Maintain Your App

After releasing your app, monitor its performance, user feedback, and any potential issues. Regularly update your app with new features, bug fixes, and performance improvements to provide the best experience to your users.

Congratulations! You have successfully built and distributed your Flutter app for production.
