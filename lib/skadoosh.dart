import 'dart:io';

void createFolder(String domain) async {
  String projectRoot = Directory.current.path;

  List<String> directories = [
    '$projectRoot/lib/$domain/data/',
    '$projectRoot/lib/$domain/data/datasources/',
    '$projectRoot/lib/$domain/data/repositories/',
    '$projectRoot/lib/$domain/data/models/',
    '$projectRoot/lib/$domain/presentation/',
    '$projectRoot/lib/$domain/presentation/view_models/',
    '$projectRoot/lib/$domain/presentation/widgets/',
    '$projectRoot/lib/$domain/presentation/views/',
    '$projectRoot/lib/$domain/domain/entities/',
    '$projectRoot/lib/$domain/domain/repositories/',
    '$projectRoot/lib/$domain/domain/usecases/',
  ];

// Loop through the list and create each directory asynchronously
  for (var dirPath in directories) {
    final directory = Directory(dirPath);
    if (await directory.exists()) {
      print('Directory "$dirPath" already exists');
      continue;
    }

    await directory.create(recursive: true);
    print('Directory "$dirPath" created');
  }
}
