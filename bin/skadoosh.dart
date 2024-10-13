import 'package:args/args.dart';
import 'package:skadoosh/skadoosh.dart';

void main(List<String> arguments) {
  final parser = ArgParser()..addOption('domain', abbr: 'd', help: 'Domain');

  var argResults = parser.parse(arguments);
  final domain = argResults['domain'];
  if (domain.isNotEmpty) {
    createFolder(domain);
  }
}
