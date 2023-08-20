library flutter_app_renamer;

import 'dart:io';

import 'package:rename/rename.dart';
import 'package:yaml/yaml.dart';

void doRename() {
  final File yamlFile = File('pubspec.yaml');
  final Map yamlData = loadYaml(yamlFile.readAsStringSync());
  final Map? yamlKeyData = yamlData['flutter_app_name'];

  if (yamlKeyData == null) {
    throw Exception('Error: missing key; your pubspec.yaml file must contain the flutter_app_name key.');
  }

  final String? newName = yamlKeyData['name'];

  if (newName == null) {
    throw Exception(
        'Error: missing name; your pubspec.yaml file must contain a valid name under the flutter_app_name key.');
  }

  final String? newId = yamlKeyData['id'];

  List<Platform> platforms = List<Platform>.empty(growable: true);

  print('Detecting platforms...');

  if (Directory('/android').existsSync()) {
    print('Found Android');
    platforms.add(Platform.android);
  }

  if (Directory('/ios').existsSync()) {
    print('Found iOS');
    platforms.add(Platform.ios);
  }

  if (Directory('/linux').existsSync()) {
    print('Found Linux');
    platforms.add(Platform.linux);
  }

  if (Directory('/macos').existsSync()) {
    print('Found MacOS');
    platforms.add(Platform.macOS);
  }

  if (Directory('/web').existsSync()) {
    print('Found web');
    platforms.add(Platform.web);
  }

  if (Directory('/windows').existsSync()) {
    print('Found Windows');
    platforms.add(Platform.windows);
  }

  print('Updating AppName...');
  print('New AppName: $newName');

  changeAppName(newName, platforms);

  print('AppName successfully changed');

  if (newId != null) {
    print('Updating BundleID');
    print('New BundleID: $newId');

    changeBundleId(newId, platforms);

    print('BundleID successfully changed');
  }
}
