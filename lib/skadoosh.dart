import 'dart:io';

import 'package:skadoosh/common.dart';
import 'package:skadoosh/template.dart';

void createCleanCodeDirectory() async {
  String projectRoot = Directory.current.path;

  stdout.writeln('Type the name of the new domain:');
  final domain = stdin.readLineSync();

  List<String> directories = [
    '$projectRoot/lib/$domain/data/',
    '$projectRoot/lib/$domain/data/repositories/',
    '$projectRoot/lib/$domain/data/models/',
    '$projectRoot/lib/$domain/presentation/',
    '$projectRoot/lib/$domain/presentation/view_models/',
    '$projectRoot/lib/$domain/presentation/widgets/',
    '$projectRoot/lib/$domain/presentation/views/',
    '$projectRoot/lib/$domain/domain/entities/',
    '$projectRoot/lib/$domain/domain/usecases/',
  ];

  // Loop through the list and create each directory asynchronously
  for (var dirPath in directories) {
    createFolder(dirPath);
  }
  print('$domain created');
}

void createViewModel() async {
  final packageName = await loadPackageName();

  stdout.writeln(
      'Type the path of the new view model: (type . if you are in current folder)');

  final String? filePath = stdin.readLineSync();

  if (filePath == null) {
    stdout.writeln('the path is required');
    return;
  }

  stdout.writeln(
      'Type the file name of the view model (ex. location_view_model):');

  final String? fileName = stdin.readLineSync();

  if (fileName == null) {
    stdout.writeln('the path is required');
    return;
  }

  String template = generateViewModelTemplate(fileName, packageName);

  createFile(filePath, fileName, template);
}

void createAPI() async {
  stdout.writeln(
      'Type the path of the new api: (type . if you are in current folder)');

  final String? filePath = stdin.readLineSync();

  if (filePath == null) {
    stdout.writeln('the path is required');
    return;
  }

  stdout.writeln('Type the file name of the api (ex. location_api): ');

  final String? fileName = stdin.readLineSync();

  if (fileName == null) {
    stdout.writeln('the path is required');
    return;
  }

  String template = generateAPIRetrofit(fileName);

  createFile(filePath, fileName, template);
}

void createUsecase() async {
  stdout.writeln(
      'Type the path of the new usecase: (type . if you are in current folder)');

  final String? filePath = stdin.readLineSync();

  if (filePath == null) {
    stdout.writeln('the path is required');
    return;
  }

  stdout.writeln('Type the file name of the usecase (ex. location_usecase): ');

  final String? fileName = stdin.readLineSync();

  if (fileName == null) {
    stdout.writeln('the path is required');
    return;
  }

  String template = generateUsecase(fileName);

  createFile(filePath, fileName, template);
}
