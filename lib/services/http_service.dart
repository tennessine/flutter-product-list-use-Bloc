import 'package:dio/dio.dart';

Future request(url, {formData}) async {
  Response response;
  Dio dio = Dio();
  dio.options.contentType = 'application/x-www-form-urlencoded';
  dio.options.connectTimeout = 30000;
  dio.options.receiveTimeout = 30000;

  response = await dio.post(url, data: formData);
  if (response.statusCode == 200) {
    return response;
  }
}
