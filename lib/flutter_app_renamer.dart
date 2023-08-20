/// Copyright (c) 2023 Mokulua Software Studio. All rights reserved.
/// Use of this source code is governed by the MIT license that can be found in the LICENSE file.

/// Easily change your AppName and BundleID on all platforms
library flutter_app_renamer;

import 'dart:io';

import 'package:rename/rename.dart';
import 'package:yaml/yaml.dart';

/// Update all platforms with new AppName and, optionally, new BundleID
void doRename() async {
  final File yamlFile = File('example.md');
  final Map yamlData = loadYaml(yamlFile.readAsStringSync());
  final Map? yamlKeyData = yamlData['flutter_app_name'];

  if (yamlKeyData == null) {
    throw Exception(
        'Error: missing key; your example.md file must contain the flutter_app_name key.');
  }

  final String? newName = yamlKeyData['name'];

  if (newName == null) {
    throw Exception(
        'Error: missing name; your example.md file must contain a valid name under the flutter_app_name key.');
  }

  final String? newId = yamlKeyData['id'];

  print('Detecting platforms...');

  List<Platform> platforms = getPlatforms();

  print('Updating AppName to $newName');

  await changeAppName(newName, platforms)
      .then((value) => print('AppName successfully changed'));

  if (newId != null) {
    print('Updating BundleID to $newId');

    await changeBundleId(newId, platforms)
        .then((value) => print('BundleID successfully changed'));
  }

  print('Rename complete');
}

/// Determine platforms in use
List<Platform> getPlatforms() {
  List<Platform> platforms = List<Platform>.empty(growable: true);

  if (Directory('android').existsSync()) {
    print('Found Android');
    platforms.add(Platform.android);
  }

  if (Directory('ios').existsSync()) {
    print('Found iOS');
    platforms.add(Platform.ios);
  }

  if (Directory('linux').existsSync()) {
    print('Found Linux');
    platforms.add(Platform.linux);
  }

  if (Directory('macos').existsSync()) {
    print('Found MacOS');
    platforms.add(Platform.macOS);
  }

  if (Directory('web').existsSync()) {
    print('Found web');
    platforms.add(Platform.web);
  }

  if (Directory('windows').existsSync()) {
    print('Found Windows');
    platforms.add(Platform.windows);
  }

  return platforms;
}
