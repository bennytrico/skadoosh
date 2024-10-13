import 'package:skadoosh/common.dart';

String generateViewModelTemplate(String fileName, String packageName) {
  return '''
import 'package:$packageName/core/view_models/base_view_model.dart'

class ${snakeToCamelCaseCapitalized(fileName)} extends BaseViewModel {

  @override
  Future<void> initModel() async {
  }
}
  ''';
}
