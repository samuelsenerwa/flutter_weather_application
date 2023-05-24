import 'package:dio/dio.dart';

import 'local_storage.dart';
import 'logger.dart';

class BaseService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: "https://samples.openweathermap.org",
    validateStatus: (status) {
      return status! < 500;
    },
    headers: {
      "Accept": "*/*",
      "Content-Type": "application/json",
      "Connection": "keep-alive",
    },
    connectTimeout: const Duration(milliseconds: 60 * 1000), //the connectTimeout should not be an int
    receiveTimeout: const Duration(milliseconds: 60 * 1000),
  ))
    ..interceptors.add(LoggingInterceptor());
  //  connectTimeout: 60 * 1000,
  //   receiveTimeout: 60 * 1000))
  //   ..interceptors.add(LoggingInterceptor());


  Future<Response> request(String url, {dynamic body, String? method}) async {
    var token = LocalStorage.getToken();

    var res = _dio.request(url,
        data: body,
        options: Options(
            method: method,
            headers:
                token != null ? {'authorization': 'Bearer $token'} : null));
    return res;
  }
}

handleError(DioError error) {
  print(error.response.toString());
  if (error.message?.contains('SocketException') == true) { //fixed the null check issue
    return 'Cannot connect. Check that you have internet connection';
  }

  if (error.type == DioErrorType.connectionTimeout) { //solved connectTiemout
    return 'Connection timed out. Please retry.';
  }

  if (error.response == null || error.response!.data is String) {
    return 'Something went wrong. Please try again later';
  }
  return 'Something went wrong. Please try again later';
}
