import 'dart:io';

import 'package:yaml/yaml.dart';

String snakeToCamelCaseCapitalized(String snakeCase) {
  return snakeCase
      .split('_') // Split the string by underscores
      .map((word) =>
          word[0].toUpperCase() + word.substring(1)) // Capitalize each word
      .join(''); // Join them without spaces
}

void createFile(String filePath, String fileName, String template) async {
  String projectRoot = Directory.current.path;

  String targetPath = '$projectRoot/$filePath';

  createFolder(targetPath);

  File file = File('$targetPath/$fileName.dart');

  if (file.existsSync()) {
    print('File $fileName already exists');
    return;
  }

  // Write the template to the file asynchronously
  await file.writeAsString(template);

  print('File created successfully at $filePath');
}

Future<String> loadPackageName() async {
  final pubspecFile = File('pubspec.yaml');

  if (!await pubspecFile.exists()) {
    throw Exception('pubspec.yaml not found!');
  }
  // Read the content of the pubspec.yaml file
  final pubspecContent = await pubspecFile.readAsString();

  // Parse the YAML content
  final yamlMap = loadYaml(pubspecContent);

  // Extract the package name
  return yamlMap['name'];
}

void createFolder(String dirPath) async {
  final directory = Directory(dirPath);

  if (await directory.exists()) {
    print('Directory "$dirPath" already exists');
    return;
  }

  await directory.create(recursive: true);
  print('Directory "$dirPath" created');
}
