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

String generateAPIRetrofit(String fileName) {
  return '''
import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

part '$fileName.g.dart';

@RestApi()
abstract class ${snakeToCamelCaseCapitalized(fileName)} {
  factory ${snakeToCamelCaseCapitalized(fileName)}(Dio dio, {String baseUrl}) = _${snakeToCamelCaseCapitalized(fileName)};
}
  ''';
}
