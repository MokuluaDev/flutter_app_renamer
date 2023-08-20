## Getting started

Add the following dev dependency to your pubspec.yaml file (either GitHub or pub.dev):

From GitHub:
```yaml
dev_dependencies:
  flutter_app_renamer:
    git:
      url: https://github.com/MokuluaDev/flutter_app_renamer.git
      ref: main
```

From pub.dev:
```yaml
dev_dependencies:
  flutter_app_renamer: ^1.0.0
```

Then add the following (`name` is required; `id` is optional):
```yaml
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

If it doesn't work, you may need to run

```shell
flutter clean
```

and try again.