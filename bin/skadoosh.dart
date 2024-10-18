import 'package:args/args.dart';
import 'package:skadoosh/skadoosh.dart';

void main(List<String> arguments) {
  final parser = ArgParser()
    ..addFlag('domain', abbr: 'd', help: 'Domain', defaultsTo: false)
    ..addFlag('view-model', abbr: 'v', help: 'View Model', defaultsTo: false)
    ..addFlag('usecase', abbr: 'u', help: 'Use Case', defaultsTo: false)
    ..addFlag(
      'api',
      abbr: 'a',
      help: 'Api',
      defaultsTo: false,
    );

  var argResults = parser.parse(arguments);

  if (argResults['domain']) {
    createCleanCodeDirectory();
  }

  if (argResults['view-model']) {
    createViewModel();
  }

  if (argResults['api']) {
    createAPI();
  }

  if (argResults['usecase']) {
    createUsecase();
  }
}
