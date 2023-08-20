# Flutter App Renamer

A command-line tool that makes it easy to change your project's AppName and BundleID by defining them in your pubspec.yaml file.

## How It Works

Flutter App Renamer uses [rename](https://pub.dev/packages/rename) behind the scenes to handle the heavy lifting. This package allows you to define your AppName and BundleID in pubspec.yaml and then update them with slightly less effort.

## Getting started

Add the following to your pubspec.yaml file. `name` is required; `id` is optional.

```yaml
dev_dependencies:
  flutter_app_renamer:
    git:
      url: https://github.com/MokuluaDev/flutter_app_renamer.git
      ref: main

flutter_app_name:
  name: "Your New Name Here"
  id: "com.example.optional"
```

## Usage

After updating your pubspec.yaml file, run the following in the terminal (in your project's directory):

```shell
flutter pub get
dart run flutter_app_renamer
```

