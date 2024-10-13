import 'package:args/args.dart';
import 'package:skadoosh/skadoosh.dart';

void main(List<String> arguments) {
  final parser = ArgParser()
    ..addOption('domain', abbr: 'd', help: 'Domain')
    ..addOption('view_model', abbr: 'v', help: 'View Model')
    ..addOption(
      'path',
      abbr: 'p',
      help: 'Path to generate file',
    );

  var argResults = parser.parse(arguments);

  if (argResults['domain'] != null) {
    createCleanCodeDirectory(argResults['domain']);
  }

  if (argResults['view_model'] != null) {
    if (argResults['path'] == null) {
      print('Path is required');
      return;
    }

    createViewModel(argResults['path'], argResults['view_model']);
  }
}
