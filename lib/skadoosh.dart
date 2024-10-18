import 'dart:io';

import 'package:skadoosh/common.dart';
import 'package:skadoosh/template.dart';

void createCleanCodeDirectory(String domain) async {
  String projectRoot = Directory.current.path;

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
}

void createViewModel(String filePath, String fileName) async {
  final packageName = await loadPackageName();

  String template = generateViewModelTemplate(fileName, packageName);

  createFile(filePath, fileName, template);
}

void createAPI(String filePath, String fileName) async {
  String template = generateAPIRetrofit(fileName);

  createFile(filePath, fileName, template);
}
