import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:weather/core/api/Endpoints.dart';
@singleton
class ApiManger {
  late Dio dio;
  ApiManger() {
    dio=Dio();
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true));
  }
  Future<Response> getData(
   // String ?endpoints,
      {
    Map<String, dynamic>? headers,

  }) {
    return dio.get("http://api.weatherapi.com/v1/forecast.json?key=6675edae374f420ebbe142858242011&q=Egypt&aqi=no",

        options: Options(
          headers: headers,
          validateStatus: (status) => true,
        ));
  }
}